note
	description: "A type checker for textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEXTUAL_BON_TYPE_CHECKER

inherit {NONE}
	TBON_TC_TEXT_ITEMS

	TBON_TC_ERROR
		rename
			make as make_error,
			code as error_code,
			message as error_message
		export
			{NONE} make_error, error_code, error_message
		undefine
			is_equal
		end

	TBON_TC_WARNING
		rename
			make as make_warning,
			code as warning_code,
			message as warning_message
		export
			{NONE} make_warning, warning_code, warning_message
		undefine
			is_equal
		end

create
	make

feature -- Initialization
	make
			-- Create a textual BON type checker.
		do
			initialize_contexts
			create {LINKED_LIST[TBON_TC_ERROR]} errors.make
			errors.compare_objects
			create {LINKED_LIST[TBON_TC_WARNING]} warnings.make
			warnings.compare_objects

			first_phase := True
			second_phase := False
		end

	initialize_contexts
			-- Initialize type checking contexts.
		local
			boolean_type: TBON_TC_BOOLEAN_TYPE
			character_type: TBON_TC_CHARACTER_TYPE
			integer_type: TBON_TC_INTEGER_TYPE
			real_type: TBON_TC_REAL_TYPE
			string_type: TBON_TC_STRING_TYPE
			any_type: TBON_TC_CLASS_TYPE
		do
			-- Create type contexts
			create informal_type_context.default_create
			create formal_type_context.default_create

			-- Create default value types
			create boolean_type.make_default_type
			create character_type.make_default_type
			create integer_type.make_default_type
			create real_type.make_default_type
			create string_type.make_default_type
			-- Create ANY
			create any_type.make (any_type_name)

			integer_type.add_ancestor (real_type)

			-- Add standard as the set of types that do not need to be in a cluster
			create exempt_from_structure.default_create
			exempt_from_structure := exempt_from_structure &
									 boolean_type & character_type &
									 real_type & integer_type &
									 string_type &
									 any_type

			-- Add default value types to context
			add_to_informal_type_context (boolean_type)
			add_to_informal_type_context (character_type)
			add_to_informal_type_context (real_type)
			add_to_informal_type_context (integer_type)
			add_to_informal_type_context (string_type)
			add_to_informal_type_context (any_type)

			add_to_formal_type_context (boolean_type)
			add_to_formal_type_context (character_type)
			add_to_formal_type_context (real_type)
			add_to_formal_type_context (integer_type)
			add_to_formal_type_context (string_type)
			add_to_formal_type_context (any_type)

			create {ARRAYED_LIST[STRING]} extended_ids.make (10)
			extended_ids.compare_objects

			create {ARRAYED_LIST[STRING]} disallowed_names.make (1)
			disallowed_names.extend (none_type_name)
			disallowed_names.compare_objects

			create unresolved_features.default_create
			create {ARRAYED_LIST[TBON_TC_TUPLE[TBON_TC_CLASS_TYPE, INTEGER]]} unresolved_conformance.make (10)
			create {ARRAYED_LIST[TBON_TC_TUPLE[TBON_TC_GENERIC, TBON_TC_CLASS_TYPE]]} unresolved_generics.make (10)
			create {ARRAYED_LIST[INHERITANCE_RELATION]} unresolved_inheritance_relations.make (10)
			create {ARRAYED_LIST[STATIC_REF]} unresolved_static_references.make (10)
		end


feature {TEXTUAL_BON_TYPE_CHECKER, TBON_TC_TEST} -- Contexts
	informal_type_context: MML_SET[TBON_TC_TYPE]
			-- What is the current informal type context?

	formal_type_context: MML_SET[TBON_TC_TYPE]
			-- What is the current formal type context?

	dynamic_object_context: MML_SET[TBON_TC_DYNAMIC_OBJECT]
			-- What is current dynamic object context (used for dynamic diagrams)?

	dynamic_scenario_context: MML_SET[TBON_TC_SCENARIO_DESCRIPTION]

	disallowed_names: LIST[STRING]

	enumerable_types: MML_SET[TBON_TC_CLASS_TYPE]

	exempt_from_structure: MML_SET[TBON_TC_CLASS_TYPE]

	extended_ids: LIST[STRING]

	variable_context: LIST[TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]]

	unresolved_conformance: LIST[TBON_TC_TUPLE[TBON_TC_CLASS_TYPE, INTEGER]]

	unresolved_features: MML_SET[TBON_TC_FEATURE]

	unresolved_generics: LIST[TBON_TC_TUPLE[TBON_TC_GENERIC, TBON_TC_CLASS_TYPE]]

	unresolved_inheritance_relations: LIST[INHERITANCE_RELATION]

	unresolved_static_references: LIST[STATIC_REF]

feature -- Status report
	first_phase: BOOLEAN
			-- Is the type checker in the first phase?
			-- During the first phase, the type context is built.

	second_phase: BOOLEAN
			-- Is the type checker in the second phase?
			-- During the second phase, all elements and statements are checked.

	class_type_exists (a_class_name: STRING; a_context: MML_SET[TBON_TC_TYPE]): BOOLEAN
			-- Does `a_name' exist in `a_context' as a class type?
		do
			Result := name_exists_in_context (a_class_name, a_context) and attached {TBON_TC_CLASS_TYPE} type_with_name (a_class_name, a_context)
		end

	cluster_type_exists (a_cluster_name: STRING; a_context: MML_SET[TBON_TC_TYPE]): BOOLEAN
			-- Does cluster type in `type_context' with the name `a_name' exist?
		do
			Result := name_exists_in_context (a_cluster_name, a_context) and attached {TBON_TC_CLUSTER_TYPE} type_with_name (a_cluster_name, a_context)
		end

	name_exists_in_context (a_name: STRING; a_context: MML_SET[TBON_TC_TYPE]): BOOLEAN
			-- Does `a_name' exist in `a_context'?
		require
			name_not_void: a_name /= Void
		do
			Result := a_context.exists (agent names_are_equal (?, a_name)) and not disallowed_names.has (a_name)
		end


feature {TEXTUAL_BON_TYPE_CHECKER, TBON_TC_TEST} -- Auxiliary features, contexts
	add_to_formal_type_context (a_type: TBON_TC_TYPE)
			-- Add `a_type' to `type_context'.
		require
			type_not_void: a_type /= Void
		do
			formal_type_context := formal_type_context & a_type
		end

	add_to_informal_type_context (a_type: TBON_TC_TYPE)
			-- Add `a_type' to `type_context'.
		require
			type_not_void: a_type /= Void
		do
			informal_type_context := informal_type_context & a_type
		end

	add_to_dynamic_object_context (an_obj: TBON_TC_DYNAMIC_OBJECT)
			-- Add `an_obj' to `dynamic_object_context'.
		require
			obj_not_void: an_obj /= Void
		do
			dynamic_object_context := dynamic_object_context & an_obj
		end

	add_to_dynamic_scenario_context (a_scenario: TBON_TC_SCENARIO_DESCRIPTION)
			-- Add `a_scenario' to `dynamic_scenario_context'.
		require
			scenario_not_void: a_scenario /= Void
		do
			dynamic_scenario_context := dynamic_scenario_context & a_scenario
		end

	names_are_equal (a_type: TBON_TC_TYPE; a_name: STRING): BOOLEAN
			-- Is the name of `a_type' equal to `a_name'? (Object equality)
		require
			type_not_void: a_type /= Void
			name_not_void: a_name /= Void
		do
			Result := a_type.name ~ a_name
		end

	class_type_with_name (a_name: STRING; a_type_context: MML_SET[TBON_TC_TYPE]): TBON_TC_CLASS_TYPE
			-- Which class type in `type_context' has the name `a_name'?
		do
			Result ?= type_with_name (a_name, a_type_context)
		end

	cluster_type_with_name (a_name: STRING; a_type_context: MML_SET[TBON_TC_TYPE]): TBON_TC_CLUSTER_TYPE
			-- Which cluster type in `type_context' has the name `a_name'?
		do
			Result ?= type_with_name (a_name, a_type_context)
		end

	type_with_name (a_name: STRING; a_type_context: MML_SET[TBON_TC_TYPE]): TBON_TC_TYPE
			-- Which type in `type_context' has the name `a_name'?
		local
			filtered_set: like a_type_context
		do
			if name_exists_in_context (a_name, a_type_context) then
				filtered_set := a_type_context.filtered (agent names_are_equal (?, a_name))
				check filtered_set.count = 1 end
				Result := filtered_set.any_item
			else
				Result := Void
			end
		ensure
			--type_not_void: Result /= Void
			name_exists_means_not_void: name_exists_in_context (a_name, a_type_context) implies Result /= Void
			names_are_equal: Result /= Void implies names_are_equal (Result, a_name)
		end

	type_of_variable (a_var_name: STRING): TBON_TC_CLASS_TYPE
			-- What is the type of the variable identified by `a_var_name'?
			-- Void if no variable with the given name is present in the context.
		require
			a_var_name /= Void and then not a_var_name.is_empty
		local
			relation: TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]
		do
			Result := Void
			relation := variable_type_relation_from_name (a_var_name)
			if relation /= Void then
				Result := relation.second
			end
		end

	variable_type_relation_from_name (a_var_name: STRING): TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]
			-- What is the variable-type relation for the variable identified by `a_var_name'?
		require
			a_var_name /= Void and then not a_var_name.is_empty
		do
			Result := Void
			from
				variable_context.start
			until
				variable_context.exhausted or Result /= Void
			loop
				if variable_context.item.first ~ a_var_name then
					Result := variable_context.item
				end
				variable_context.forth
			end
		end

feature -- Auxiliary features, type checking

	all_features (a_class_type: TBON_TC_CLASS_TYPE; seen_ancestors: LIST[STRING]): MML_SET[TBON_TC_FEATURE]
			-- What is the set of all the features (including inherited ones) of `a_class_type'?
		local
			ancestors: MML_SET[TBON_TC_CLASS_TYPE]
			ancestor: TBON_TC_CLASS_TYPE
		do
			seen_ancestors.compare_objects
			if a_class_type.ancestors.is_empty then
				Result := a_class_type.features
			else
				Result := a_class_type.features
				from
					ancestors := a_class_type.ancestors.twin
				until
					ancestors.is_empty
				loop
					ancestor := ancestors.any_item

					if not seen_ancestors.has (ancestor.name) then
						seen_ancestors.extend (ancestor.name)
						Result := Result + all_features (ancestor, seen_ancestors)
					end

					ancestors := ancestors / ancestor
				end
			end
		end

--	deferred_features (a_class_type: TBON_TC_CLASS_TYPE): MML_SET[TBON_TC_FEATURE]
--			-- What is the set of all the deferred features (including inherited ones) of `a_class_type'?
--		do
--			Result := all_features (a_class_type).filtered (
--				agent (l_feature: TBON_TC_FEATURE): BOOLEAN
--					do
--						Result := l_feature.is_deferred
--					end
--			)
--		end

	feature_arguments_conform (first_feature, second_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `first_feature' arguments conform to `second_feature' arguments?
		require
			not_void: first_feature /= Void and second_feature /= Void
		local

		do
			if first_feature.arguments.count = second_feature.arguments.count then
				Result := True
				from
					first_feature.arguments.start
					second_feature.arguments.start
				until
					first_feature.arguments.exhausted and second_feature.arguments.exhausted
				loop
					if not (first_feature.arguments.item_for_iteration.type.conforms_to (second_feature.arguments.item_for_iteration.type)) then
						Result := False
					end
					first_feature.arguments.forth
					second_feature.arguments.forth
				end
			else
				Result := False
			end
		end

	instantiated_type (a_type: TBON_TC_CLASS_TYPE; a_class_type: CLASS_TYPE; enclosing_class: TBON_TC_CLASS_TYPE): TBON_TC_CLASS_TYPE
			-- Instantiate `a_type' with actual parameters from `a_class_type'.
		require
			a_type /= Void
			a_class_type /= Void
			enclosing_class /= Void
		local
			type_instance: TBON_TC_CLASS_TYPE
			type_arg_no: INTEGER
			success: BOOLEAN
		do
			if a_type.generics.count > 0 and a_class_type.actual_generic_count > 0 then
				-- If type has arguments, assign copy of type to feature in order to not overwrite type in context.
				type_instance := a_type.deep_twin
				from
					a_class_type.actual_generics.start
					type_arg_no := 1
					success := True
				until
					a_class_type.actual_generics.after
				loop
					-- Check class type
					if a_class_type.actual_generics.item_for_iteration.is_class_type then

						success := success and check_class_type (a_class_type.actual_generics.item_for_iteration.class_type, enclosing_class, type_instance, 0, type_arg_no)

					elseif a_class_type.actual_generics.item_for_iteration.is_formal_generic_name then

						success := success and check_formal_generic_name (a_class_type.actual_generics.item_for_iteration.formal_generic_name, enclosing_class, type_instance, 0, type_arg_no)

					end

					type_arg_no := type_arg_no + 1
					a_class_type.actual_generics.forth
				end

				if success then
					Result := type_instance
				else
					Result := a_type
				end

			else
				Result := a_type
			end
		end

feature -- Error handling
	add_error (an_error_code: INTEGER; an_error_message: STRING)
			-- Add an error message.
		do
			errors.extend (create {TBON_TC_ERROR}.make (an_error_code, an_error_message))
		end

	add_warning (a_warning_code: INTEGER; a_warning_message: STRING)
			-- Add a warning message.
		do
			warnings.extend (create {TBON_TC_WARNING}.make (a_warning_code, a_warning_message))
		end

	errors: LIST[TBON_TC_ERROR]
			-- What error messages have been emitted from this type checker?

--	print_error_messages_to_file (an_output_stream: PLAIN_TEXT_FILE)
--			-- Print error messages to `an_output_stream'.
--		do
--			io.set_file_default (an_output_stream)
--			error_messages.do_all (agent (msg: STRING) do io.put_string (msg) end)
--		end

	print_error_messages_to_stderr
			-- Print error messages to stderr.
		do
			io.set_error_default
			io.put_string ("%NErrors:%N")
			errors.do_all (agent (error: TBON_TC_ERROR) do io.put_string (error.message); io.put_string ("%N") end)
		end

	print_error_messages_to_stdout
			-- Print error messages to stderr.
		do
			io.set_output_default
			io.put_string ("%NErrors:%N")
			errors.do_all (agent (error: TBON_TC_ERROR) do io.put_string (error.message); io.put_string ("%N") end)
		end

	warnings: LIST[TBON_TC_WARNING]
			-- What warnings have been emitted from this type checker?

	print_warnings_to_stderr
			-- Print warnings to stderr.
		do
			io.set_error_default
			io.put_string ("%NWarnings:%N")
			warnings.do_all (agent (warning: TBON_TC_WARNING) do io.put_string (warning.message); io.put_string ("%N") end)
		end

	print_warnings_to_stdout
			-- Print warnings to stderr.
		do
			io.set_output_default
			io.put_string ("%NWarnings:%N")
			warnings.do_all (agent (warning: TBON_TC_WARNING) do io.put_string (warning.message); io.put_string ("%N") end)
		end

	report_unresolved_features
			-- Add error messages for all unresolved features.
		local
			iteration_set: like unresolved_features
			current_feature: TBON_TC_FEATURE
			current_argument: TBON_TC_FEATURE_ARGUMENT
		do
			from
				iteration_set := unresolved_features.twin
			until
				iteration_set.is_empty
			loop
				current_feature := iteration_set.any_item

				if not class_type_exists (current_feature.type.name, formal_type_context) then
				 	add_error (err_code_feature_type_does_not_exist, err_feature_type_does_not_exist (current_feature.name, current_feature.type.name))
				end

				from
					current_feature.arguments.start
				until
					current_feature.arguments.after
				loop
					current_argument := current_feature.arguments.item_for_iteration
					if not class_type_exists (current_argument.type.name, formal_type_context) then
						add_error (err_code_feature_argument_type_does_not_exist, err_feature_argument_type_does_not_exist (current_feature.name, current_argument.formal_name, current_argument.type.name))
					end

					current_feature.arguments.forth
				end

				iteration_set := iteration_set / current_feature
			end
		end

feature -- Type checking, general
	check_bon_specification (a_bon_spec: BON_SPECIFICATION): BOOLEAN
			-- Does `a_bon_spec' type check as a type BON_SPECIFICATION?
		require
			a_bon_spec /= Void
		local
			element: SPECIFICATION_ELEMENT
			elements: SPECIFICATION_ELEMENTS

			class_dictionaries: LIST[CLASS_DICTIONARY]
		do
			Result := True
			elements := a_bon_spec.elements
			create {LINKED_LIST[CLASS_DICTIONARY]} class_dictionaries.make

			from elements.start	until elements.after loop
				element := elements.item_for_iteration

				io.put_string ("Checking!")

				if attached {COMMENT} element as comment then
					Result := Result and check_comment (comment)
				elseif attached {INFORMAL_CHART} element as chart then
					Result := Result and check_informal_chart (chart)
				elseif attached {CLASS_DICTIONARY} element as class_dict then
					class_dictionaries.extend (class_dict)
				elseif attached {STATIC_DIAGRAM} element as diagram then
					Result := Result and check_static_diagram (diagram)
				elseif attached {DYNAMIC_DIAGRAM} element as diagram then
					Result := Result and check_dynamic_diagram (diagram)
				else
					Result := False
				end

				elements.forth
			end

			if first_phase then
				first_phase := False
				second_phase := True

				if not unresolved_features.is_empty then
					report_unresolved_features
					Result := False
				end

				-- Resolve generics
				Result := Result and resolve_generics

				Result := Result and check_bon_specification (a_bon_spec)
			elseif second_phase then
				Result := check_informal_structure and Result
				Result := check_formal_structure and Result
				Result := Result and resolve_static_references
				Result := Result and class_dictionaries.for_all (agent check_class_dictionary)
				Result := Result and resolve_conformance
				if not errors.is_empty then
					print_error_messages_to_stderr
					Result := False
				end
				if not warnings.is_empty then
					print_warnings_to_stdout
				end
			end
		end

	check_ancestors (a_main_class, an_ancestor_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Is the inheritance hierarchy of the BON specification OK?
		do
			Result := an_ancestor_class.ancestors.for_all (
				agent (a_descendant, an_ancestor: TBON_TC_CLASS_TYPE): BOOLEAN
					do
						Result := not (a_descendant ~ an_ancestor)
					end (a_main_class, ?)
			)

			if Result then
				Result := Result and an_ancestor_class.ancestors.for_all (
										agent (a_descendant, an_ancestor: TBON_TC_CLASS_TYPE): BOOLEAN
											do
												Result := check_ancestors (a_descendant, an_ancestor)
											end (a_main_class, ?)
									 )
			else
				add_error (err_code_class_inherits_from_itself, err_class_inherits_from_itself (a_main_class.name, an_ancestor_class.name))
				Result := False
			end
		end

	check_comment (an_element: COMMENT): BOOLEAN
			-- Does `an_element' type check as a type COMMENT?
			-- Rule:
			-- 	In an environment where all line comments in a comment 'c' are STRINGs, 'c' is a type COMMENT.
		note
			rule: "[
					In an environment where all line comments in `an_element' are of type STRING, `an_element' is OK.
				]"
		do
			Result := True
				-- A comment is type checked by default, as it is a list of STRING.
		end

	check_formal_structure: BOOLEAN
			-- Is the structure of the abstract syntax OK?
		local
			types: like informal_type_context
			type: TBON_TC_TYPE
		do
			Result := True

			from
				types := formal_type_context.twin
		 	until
		 		types.is_empty
			loop
				type := types.any_item

				if attached {TBON_TC_CLASS_TYPE} type as class_type and then
					not exempt_from_structure.exists (agent (a_class, other_class: TBON_TC_CLASS_TYPE): BOOLEAN do Result := a_class |=| other_class end (?, class_type)) then
					-- In formal BON, a class does not have to be in a cluster

					-- Check that class does not inherit from itself
					Result := check_ancestors (class_type, class_type) and Result
				elseif attached {TBON_TC_CLUSTER_TYPE} type as cluster_type then

					Result := True
							-- No structure restrictions on clusters
				end

				types := types / type
			end
		end

	check_informal_structure: BOOLEAN
			-- Is the structure of the abstract syntax OK?
		local
			types: like informal_type_context
			type: TBON_TC_TYPE
		do
			Result := True

			from
				types := informal_type_context.twin
		 	until
		 		types.is_empty
			loop
				type := types.any_item

				if attached {TBON_TC_CLASS_TYPE} type as class_type and then
					not exempt_from_structure.exists (agent (a_class, other_class: TBON_TC_CLASS_TYPE): BOOLEAN do Result := a_class |=| other_class end (?, class_type)) then
					-- Check that class is in a cluster
					if class_type.cluster = Void then
						add_error (err_code_class_not_in_cluster, err_class_not_in_cluster (class_type.name))
						Result := False
					end

					-- Check that class does not inherit from itself
					Result := check_ancestors (class_type, class_type) and Result
				elseif attached {TBON_TC_CLUSTER_TYPE} type as cluster_type then
					if cluster_type.parent = Void and not cluster_type.is_in_system_chart then
						add_error (err_code_cluster_not_in_cluster_or_system, err_cluster_not_in_cluster_or_system (cluster_type.name))
						Result := False
					elseif cluster_type.parent /= Void and cluster_type.is_in_system_chart then
						add_error (err_code_cluster_in_both_cluster_and_system, err_cluster_in_both_cluster_and_system (cluster_type.name))
						Result := False
					end
				end

				types := types / type
			end
		end

	resolve_conformance: BOOLEAN
			-- Resolve conformance checking on generics
		local
			current_type: TBON_TC_CLASS_TYPE
			type_arg_no: INTEGER
		do
			Result := True
			from
				unresolved_conformance.start
			until
				unresolved_conformance.exhausted
			loop
				current_type := unresolved_conformance.item.first
				type_arg_no := unresolved_conformance.item.second
				if not current_type.generics[type_arg_no].is_valid_actual_type (current_type.generics[type_arg_no].actual_type) then
					-- Error - actual type does not conform to bounding type.
					add_error (err_code_actual_type_does_not_match_bounding_type, err_actual_type_does_not_match_bounding_type (current_type.generics[type_arg_no].formal_generic_name, current_type.generics[type_arg_no].actual_type.name, current_type.name))
					Result := False
				end

				unresolved_conformance.forth
			end
		end

	resolve_features (a_class_type: TBON_TC_CLASS_TYPE)
			-- Resolve unresolved features that specifies `a_class_type' as type or argument type.
		local
			resolving_set: like unresolved_features
			iteration_set: like unresolved_features
			l_feature: TBON_TC_FEATURE
		do
			resolving_set := unresolved_features.filtered (
				agent (l_l_feature: TBON_TC_FEATURE; l_class: TBON_TC_CLASS_TYPE): BOOLEAN
					do
						Result := l_l_feature.type.name ~ l_class.name or (l_l_feature.arguments.there_exists (
																			agent (argument: TBON_TC_FEATURE_ARGUMENT; l_l_class: TBON_TC_CLASS_TYPE): BOOLEAN
																				do
																					Result := (argument.type.name ~ l_l_class.name)
																				end (?, l_class)
																		))
					end (?, a_class_type)
				)

			from
				iteration_set := resolving_set.twin
			until
				iteration_set.is_empty
			loop
				l_feature := iteration_set.any_item

				-- If type of features matches type we are resolving for, resolve it.
				if l_feature.type.name ~ a_class_type.name then
					l_feature.set_type (a_class_type)
				end

				-- If any arguments matches type we are resolving for, resolve it.
				from
					l_feature.arguments.start
				until
					l_feature.arguments.after
				loop
					if l_feature.arguments.item_for_iteration.type.name ~ a_class_type.name then
						l_feature.arguments.item_for_iteration.set_type (a_class_type)
					end

					l_feature.arguments.forth
				end

				-- If type of feature and types of all arguments are resolved, remove from unresolved features
				if class_type_exists (l_feature.type.name, formal_type_context) and
					l_feature.arguments.for_all (agent (argument: TBON_TC_FEATURE_ARGUMENT): BOOLEAN do Result := class_type_exists (argument.type.name, formal_type_context) end)
				then
					unresolved_features := unresolved_features / l_feature
				end

				iteration_set := iteration_set / l_feature
			end
		end

	resolve_generics: BOOLEAN
			-- Resolve generics with respect to class names in context.
		local
			is_unique_name: BOOLEAN
			current_generic: TBON_TC_GENERIC
			enclosing_class: TBON_TC_CLASS_TYPE
		do
			Result := True
					-- If no generics are present in system, it should not fail.
			from
				unresolved_generics.start
			until
				unresolved_generics.exhausted
			loop
				current_generic := unresolved_generics.item.first
				enclosing_class := unresolved_generics.item.second
				Result := not formal_type_context.exists (
					agent (type: TBON_TC_TYPE; generic: TBON_TC_GENERIC): BOOLEAN
						do
							Result := type.name ~ generic.formal_generic_name
						end (?, current_generic)
				)

				if Result then
					is_unique_name := not enclosing_class.generics.range.exists (
						agent (l_generic: TBON_TC_GENERIC; l_generic_name: STRING): BOOLEAN
							do
								Result := l_generic.formal_generic_name ~ l_generic_name
							end (?, current_generic.formal_generic_name)
					)

					if is_unique_name then
						-- If the formal generic name is OK, check that the bounding type exists
						if current_generic.bounding_type /= Void then
							if attached {TBON_TC_CLASS_TYPE} type_with_name (current_generic.bounding_type.name, formal_type_context) as bounding_type then
								current_generic.set_bounding_type (bounding_type)
							else
								-- Error - bounding type does not exist
								add_error (err_code_class_does_not_exist, err_class_does_not_exist (current_generic.bounding_type.name))
								Result := False
							end
						end

						enclosing_class.add_type_parameter (current_generic)
					else
						add_error (err_code_formal_generic_name_appears_more_than_once, err_formal_generic_name_appears_more_than_once (current_generic.formal_generic_name, enclosing_class.name))
						Result := False
					end
				else
					add_error (err_code_formal_generic_name_has_same_name_as_class, err_formal_generic_name_has_same_name_as_class (current_generic.formal_generic_name, enclosing_class.name))
					Result := False
				end

				unresolved_generics.forth
			end
		end

	resolve_inheritance_relations: BOOLEAN
			-- Resolve inheritance relations with respect to inheritance strucure.
		do
			Result := unresolved_inheritance_relations.for_all (
				agent (relation: INHERITANCE_RELATION): BOOLEAN
					do
						Result := attached {TBON_TC_CLASS_TYPE} type_with_name (relation.child.class_name, formal_type_context) as child and then
								  attached {TBON_TC_CLASS_TYPE} type_with_name (relation.parent.class_name, formal_type_context) as parent and then
								  child.conforms_to (parent)
						if not Result then
							add_error (err_code_class_does_not_inherit_from_class, err_class_does_not_inherit_from_class (relation.child.class_name, relation.parent.class_name))
						end
					end
			)
		end

	resolve_static_references: BOOLEAN
			-- Resolve static references with respect to the cluster structure.
		do
			Result := unresolved_static_references.for_all (
				agent (ref: STATIC_REF): BOOLEAN
					do
						Result := check_static_reference (ref)
					end
			)
		end

feature -- Type checking, informal

	check_class_chart (an_element: CLASS_CHART): BOOLEAN
			-- Does `an_element' type check as a type CLASS_CHART?
		note
			rule: "[
					In an environment where 
					`an_element' exists and has a unique name,
					and all ancestors exist, 
					`an_element' is OK.
					The inheritance hierarchy is checked in check_structure.
				]"
		local
			class_type, current_class: TBON_TC_CLASS_TYPE
			parents: CLASS_NAME_LIST
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name, informal_type_context) then
					create class_type.make (an_element.name.as_upper)
					add_to_informal_type_context (class_type)
				else
					add_error (err_code_class_exists, err_class_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				Result := True

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.name, informal_type_context) as a_class then
					current_class := a_class
				else
					add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.name))
					Result := False
				end

				if an_element.has_parents then
					parents := an_element.parents

					from parents.start until parents.after
					loop
						if attached {TBON_TC_CLASS_TYPE} type_with_name (parents.item_for_iteration.string, informal_type_context) as ancestor then
							current_class.add_ancestor (ancestor)
						else
							add_error (err_code_ancestor_does_not_exist, err_ancestor_does_not_exist (current_class.name, parents.item_for_iteration.string))
							Result := False
						end

						parents.forth
					end
				end
			else
				Result := False
			end
		ensure
			-- First phase
			not_in_old_environment:
				(first_phase and Result) implies not (old informal_type_context.exists (
					agent (a_type: TBON_TC_TYPE; a_class: CLASS_CHART): BOOLEAN
						do
							Result := a_type.name ~ a_class.name
						end (?, an_element))
					)

			class_name_exists: first_phase implies name_exists_in_context (an_element.name, informal_type_context)

			-- Second phase
			ancestors_exist:
			(second_phase and Result and an_element.has_parents) implies an_element.parents.for_all (
				agent (name: STRING): BOOLEAN
					do
						Result := class_type_exists (name, informal_type_context)
					end
			)
		end

	check_class_dictionary (an_element: CLASS_DICTIONARY): BOOLEAN
			-- Does `an_element' type check as a type CLASS_DICTIONARY?
		note
			rule: "[
				In an environment where all contained dictionary elements of `an_element' is OK,
				`an_element' is OK
				]"
		do
			if first_phase then
				Result := False
					-- Shouldn't be called in first phase.
			else

				Result := an_element.entries.for_all (agent check_dictionary_entry)

			end
		end

	check_cluster_chart (an_element: CLUSTER_CHART): BOOLEAN
			-- Does `an_element' type check as a type CLUSTER_CHART?
		note
			rule: "[
					In an environment where 
					`an_element' exists and has a unique name,
					and all subclusters exist and are not contained in other clusters or system charts,
					and all contained classes exist and are not contained in other clusters,
					and `an_element' is not a subcluster of `an_element', 
					`an_element' is OK.
				]"
		--require
		--	name_exists: second_phase implies name_exists_in_context (an_element.name, informal_type_context)
		local
			cluster_type: TBON_TC_CLUSTER_TYPE
			current_cluster: TBON_TC_CLUSTER_TYPE

			class_entries: CLASS_ENTRIES
			cluster_entries: CLUSTER_ENTRIES
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name, informal_type_context) then
					create cluster_type.make (an_element.name.as_upper)
					add_to_informal_type_context (cluster_type)
				else
					add_error (err_code_cluster_exists, err_cluster_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				if attached {TBON_TC_CLUSTER_TYPE} type_with_name (an_element.name, informal_type_context) as cluster then
					current_cluster := cluster
				end

				Result := True


				if an_element.has_classes then
					class_entries := an_element.classes

					from class_entries.start until class_entries.after
					loop
						-- Check if class exists in context
						if attached {TBON_TC_CLASS_TYPE} type_with_name (class_entries.item_for_iteration.name, informal_type_context) as class_type then
							-- Add class to cluster types
							current_cluster.add_type (class_type)
							-- Check that no class is in more than one cluster
							-- If cluster is not Void, then the class is already in a cluster, and hence is in more than one cluster.
							if class_type.cluster = Void then
								class_type.set_cluster (current_cluster)
							else
								add_error (err_code_class_already_in_cluster, err_class_already_in_cluster (current_cluster.name, class_type.name, class_type.cluster.name))
								Result := False
							end

						else
							add_error (err_code_class_does_not_exist, err_class_does_not_exist (class_entries.item_for_iteration.name))
							Result := False
						end

						class_entries.forth
					end

				end


				if an_element.has_clusters then
					cluster_entries := an_element.clusters

					from cluster_entries.start until cluster_entries.after
					loop
						-- Check if cluster exists in context
						if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster_entries.item_for_iteration.name, informal_type_context) as cluster then
							-- Add cluster to cluster types
							current_cluster.add_type (cluster)
							-- Check that no cluster is in more than one cluster
							-- If parent is not Void, then the cluster is already in a cluster, and hence is in more than one cluster.
							if cluster.parent = Void then
								cluster.set_parent (current_cluster)
							else
								add_error (err_code_cluster_already_in_cluster, err_cluster_already_in_cluster (current_cluster.name, cluster.name, cluster.parent.name))
								Result := False
							end

							-- Check that current cluster does not have itself as a subcluster.
							if cluster.name ~ current_cluster.name then
								add_error (err_code_cluster_contains_itself, err_cluster_contains_itself (current_cluster.name))
								Result := False
							end
						else
							add_error (err_code_cluster_does_not_exist, err_cluster_does_not_exist (cluster_entries.item_for_iteration.name))
							Result := False
						end

						cluster_entries.forth
					end
				end

			else
				Result := False
			end
		ensure
			-- First phase
			not_in_old_environment:
				(first_phase and Result) implies not (old informal_type_context.exists (
					agent (a_type: TBON_TC_TYPE; a_cluster: CLUSTER_CHART): BOOLEAN
						do
							Result := a_type.name ~ a_cluster.name
						end (?, an_element))
					)

			name_exists: first_phase implies name_exists_in_context (an_element.name, informal_type_context)
				-- This will always hold, no matter the errors.

			-- Second phase
			subclusters_exist: (second_phase and Result and an_element.has_clusters) implies an_element.clusters.for_all (
				agent (a_cluster: CLUSTER_ENTRY): BOOLEAN
					do
						Result := cluster_type_exists (a_cluster.name, informal_type_context)
					end
			)

			contained_classes_exist: (second_phase and Result and an_element.has_classes) implies an_element.classes.for_all (
				agent (a_class: CLASS_ENTRY): BOOLEAN
					do
						Result := class_type_exists (a_class.name, informal_type_context)
					end
			)

			not_subcluster_of_self: (second_phase and Result and an_element.has_clusters) implies an_element.clusters.for_all (
				agent (a_cluster: CLUSTER_ENTRY; a_chart: CLUSTER_CHART): BOOLEAN
					do
						Result := not (a_chart.name ~ a_cluster.name)
					end (?, an_element)
			)

		end

	check_creation_chart (an_element: CREATION_CHART): BOOLEAN
			-- Does `an_element' type check as a type CREATION_CHART?
		note
			rule: "[
					In an environment where all creator classes exist,
					and all target/created classes exist,
					`an_element' is OK.
				]"
		local
			creation_entries: CREATION_ENTRIES
			current_entry: CREATION_ENTRY
			current_target: STRING
			seen_entries: LIST[CREATION_ENTRY]
		do
			if first_phase then

				Result := True
					-- Nothing to do for first phase

			elseif second_phase then

				Result := True

				if an_element.entries_count > 0 then
					creation_entries := an_element.entries
				end

				-- Entries should be compared by object equality
				create {ARRAYED_LIST[CREATION_ENTRY]} seen_entries.make (10)
				seen_entries.compare_objects

				-- For each creation entry
				from creation_entries.start until creation_entries.after
				loop
					current_entry := creation_entries.item_for_iteration
					-- Check that creator class exists
					if not class_type_exists (current_entry.creator, informal_type_context) then
						add_error (err_code_creator_does_not_exist, err_creator_does_not_exist (an_element.name, current_entry.creator))
						Result := False
					end

					-- Check that all created classes exist
					from current_entry.targets.start until current_entry.targets.after
					loop
						current_target := current_entry.targets.item_for_iteration
						if not class_type_exists (current_target, informal_type_context) then
							add_error (err_code_target_does_not_exist, err_target_does_not_exist (an_element.name, current_target))
							Result := False
						end

						current_entry.targets.forth
					end


					-- Check for duplicate entries - emit warning if found
					if seen_entries.has (current_entry) then
						add_warning (warn_code_duplicate_creation_entry, warn_duplicate_creation_entry (an_element.name, current_entry.creator))
					end
					seen_entries.extend (current_entry)

					creation_entries.forth
				end

			else
				Result := False
			end
		ensure
			all_creators_exist:
			(second_phase and Result and an_element.entries_count > 0) implies an_element.entries.for_all (
				agent (entry: CREATION_ENTRY): BOOLEAN
					do
						Result := class_type_exists (entry.creator, informal_type_context)
					end
			)

			all_created_classes_exist:
			(second_phase and Result and an_element.entries_count > 0) implies an_element.entries.for_all (
				agent (entry: CREATION_ENTRY): BOOLEAN
					local
						target: STRING
					do
						Result := True

						from entry.targets.start until entry.targets.after
						loop
							target := entry.targets.item_for_iteration
							Result := Result and class_type_exists (target, informal_type_context)
							entry.targets.forth
						end
					end
			)
		end

	check_dictionary_entry (an_element: DICTIONARY_ENTRY): BOOLEAN
			-- Does `an_element' type check as a type DICTIONARY_ENTRY?
		note
			rule: "[
				In an environment where the class name of `an_element' exists in the environment,
				and the class idenfitied by the class name is the cluster identified by the cluster name
				of `an_element',
				`an_element' is OK.
				]"
		do
			if first_phase then
				Result := False
					-- Shouldn't be called in first phase
			else

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.class_name, informal_type_context) as class_type then
					if attached {TBON_TC_CLUSTER_TYPE} type_with_name (an_element.cluster, informal_type_context) as cluster then
						if not (class_type.cluster.name ~ cluster.name) then
							-- Error - class does not belong to specified cluster
							add_error (err_code_class_not_in_specified_cluster, err_class_not_in_specified_cluster (an_element.class_name, an_element.cluster))
							Result := False
						end
					else
						-- Error - specified cluster does not exist
						add_error (err_code_cluster_does_not_exist, err_cluster_does_not_exist (an_element.cluster))
						Result := False
					end

				else
					-- Error - specified class does not exist
					add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.class_name))
					Result := False
				end
			end
		end

	check_event_chart (an_element: EVENT_CHART): BOOLEAN
			-- Does `an_element' type check as a type EVENT_CHART?
		note
			rule: "[
					In an environment where all involved classes in all events exist,
					`an_element' is OK.
				]"
		local
			event_entries: EVENT_ENTRIES
			current_entry: EVENT_ENTRY
			seen_entries: LIST[STRING]
		do
			if first_phase then

				Result := True
					-- Nothing to do for first phase

			elseif second_phase then

				Result := True
				if an_element.entries_count > 0 then
					event_entries := an_element.entries
				end

				-- Entries should be compared by object equality
				create {ARRAYED_LIST[STRING]} seen_entries.make (10)
				seen_entries.compare_objects

				-- For each event entry
				from event_entries.start until event_entries.after
				loop
					current_entry := event_entries.item_for_iteration
					-- Check that all involved classes exist
					from current_entry.classes_involved.start until current_entry.classes_involved.after
					loop
						if not (class_type_exists (current_entry.classes_involved.item_for_iteration, informal_type_context))
						then
							add_error (err_code_involved_class_does_not_exist, err_involved_class_does_not_exist (an_element.name, current_entry.name, current_entry.classes_involved.item_for_iteration))
							Result := False
						end

						current_entry.classes_involved.forth
					end

					-- Check for duplicate event names - emit warnings if found.
					if seen_entries.has (current_entry.name) then
						add_warning (warn_code_duplicate_event_entry, warn_duplicate_event_entry (an_element.name, current_entry.name))
					end
					seen_entries.extend (current_entry.name)

					event_entries.forth
				end

			else
				Result := False
			end
		ensure
			all_involved_classes_exist:
			(second_phase and Result and an_element.entries_count > 0) implies
				an_element.entries.for_all (
					agent (entry: EVENT_ENTRY): BOOLEAN
							-- Check if all classes exist in context and are class types.
						do
							Result := True
							from entry.classes_involved.start until entry.classes_involved.after
							loop
								Result := Result and class_type_exists (entry.classes_involved.item_for_iteration, informal_type_context)
							end
						end
				)
		end

	check_informal_chart (an_element: INFORMAL_CHART): BOOLEAN
			-- Does `an_element' type check as a type INFORMAL_CHART?
		do
			if attached {SYSTEM_CHART} an_element as chart then
				Result := check_system_chart (chart)
			elseif attached {CLASS_CHART} an_element as chart then
				Result := check_class_chart (chart)
			elseif attached {CLUSTER_CHART} an_element as chart then
				Result := check_cluster_chart (chart)
			elseif attached {EVENT_CHART} an_element as chart then
				Result := check_event_chart (chart)
			elseif attached {SCENARIO_CHART} an_element as chart then
				Result := check_scenario_chart (chart)
			elseif attached {CREATION_CHART} an_element as chart then
				Result := check_creation_chart (chart)
			else
				Result := False
			end
		end

	check_scenario_chart (an_element: SCENARIO_CHART): BOOLEAN
			-- Does `an_element' type check as a type SCENARIO_CHART?
		note
			rule: "[
					In an environment where all scenario entries have type SCENARIO_ENTRY,
					`an_element' is OK.
				]"
		local
			scenarios: SCENARIO_ENTRIES
		do
			if first_phase then

				Result := True

			elseif second_phase then
				Result := True

				if an_element.has_entries then

					scenarios := an_element.entries

					-- Check for duplicate scenarios. Emit warning if any are found.
					scenarios.do_all (
						agent (entry: SCENARIO_ENTRY; entries: SCENARIO_ENTRIES; chart: SCENARIO_CHART)
							local
								occurrences: INTEGER
							do
								occurrences := 0
								from entries.start until entries.after
								loop
									if entry.name ~ entries.item_for_iteration.name then
										occurrences := occurrences + 1
									end
									entries.forth
								end

								if occurrences > 1 then
									add_warning (warn_code_duplicate_scenario_entry, warn_duplicate_scenario_entry (chart.name, entry.name))
								end
							end (?, scenarios, an_element)
					)

				end
			else
				Result := False
			end
		end


	check_system_chart (an_element: SYSTEM_CHART): BOOLEAN
			-- Does `an_element' type check as a type SYSTEM_CHART?
		note
			rule: "[
				In an environment where all the contained clusters in `an_element' exist,
				`an_element' is OK.
				]"
 		local
 			clusters: CLUSTER_ENTRIES
 			cluster: CLUSTER_ENTRY
 		do
			if first_phase then

				Result := True

			elseif second_phase then
				clusters := an_element.clusters

				Result := True

				from clusters.start until clusters.after loop
					cluster := clusters.item_for_iteration

					if not name_exists_in_context (cluster.name, informal_type_context) then
						add_error (err_code_cluster_does_not_exist, err_cluster_does_not_exist (cluster.name))
						Result := False
					else
						if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster.name, informal_type_context) as cluster_type then
							if cluster_type.is_in_system_chart then
								add_error (err_code_cluster_already_in_system_chart, err_cluster_already_in_system_chart (cluster_type.name))
								Result := False
							else
								cluster_type.set_is_in_system_chart
							end
						end
					end

					clusters.forth
				end
			else
				Result := False
			end
		ensure
			all_clusters_exist: (second_phase and Result) implies an_element.clusters.for_all (agent (entry: CLUSTER_ENTRY): BOOLEAN do Result := name_exists_in_context (entry.name, informal_type_context) end)
				-- for_all entry member_of clusters such_that entry: CLUSTER_ENTRY it_holds exists cluster member_of context such_that cluster: TBON_TC_CLUSTER_TYPE it_holds cluster.name = entry.name
				-- If the type checker claims that the system chart is OK, all its clusters must exist.
		end

feature -- Type checking, static diagrams
	check_class_interface (an_element: CLASS_INTERFACE; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type CLASS_INTERFACE?
		note
			rule: "[
				In an environment where all ancestors of `enclosing_class' exist,
				and all features are OK,
				and the class invariant is OK,
				and `enclosing_class' does not inherit from itself,
				`an_element' is OK.
				]"
				-- Inheritance structure is checked in `check_formal_structure'
		local
			ancestors: CLASS_TYPE_LIST
			feature_clauses: FEATURE_CLAUSE_LIST
			feature_clause: FEATURE_CLAUSE
		do
			if first_phase then

				Result := True

				-- Check feature clauses
				from
					feature_clauses := an_element.features
					feature_clauses.start
				until
					feature_clauses.after
				loop
					feature_clause := feature_clauses.item_for_iteration
					Result := check_feature_clause (feature_clause, enclosing_class) and Result
					feature_clauses.forth
				end

--				-- Check invariant
--				if an_element.class_invariant_count > 0 then
--					Result := check_assertion (an_element.class_invariant, enclosing_class)
--				end

			elseif second_phase then

				Result := True

				-- Add ancestors to enclosing class
				if an_element.parent_count > 0 then
					ancestors := an_element.parents

					from ancestors.start until ancestors.after
					loop
						if attached {TBON_TC_CLASS_TYPE} type_with_name (ancestors.item_for_iteration.class_name, formal_type_context) as ancestor then
							enclosing_class.add_ancestor (ancestor)
						else
							add_error (err_code_ancestor_does_not_exist, err_ancestor_does_not_exist (enclosing_class.name, ancestors.item_for_iteration.class_name))
							Result := False
						end

						ancestors.forth
					end
				end

				-- Check feature clauses
				from
					feature_clauses := an_element.features
					feature_clauses.start
				until
					feature_clauses.after
				loop
					feature_clause := feature_clauses.item_for_iteration
					Result := check_feature_clause (feature_clause, enclosing_class) and Result
					feature_clauses.forth
				end

				-- Check invariant
				if an_element.class_invariant_count > 0 then
					Result := check_assertion (an_element.class_invariant, enclosing_class, Void)
				end

			else
				Result := False
			end

		ensure
			ancestors_exist:
			(second_phase and Result and an_element.parent_count > 0) implies
				an_element.parents.for_all (
					agent (parent: CLASS_TYPE): BOOLEAN
						do
							Result := class_type_exists (parent.class_name, formal_type_context)
						end
				)
		end

	check_class_specification (an_element: CLASS_SPECIFICATION): BOOLEAN
			-- Does `an_element' type check as a type CLASS_SPECIFICATION?
		note
			rule: "[
				In an environment where `an_element' exists and has a unique name,
				and all generic arguments are unique (name does not exist in context) and their bounding classes exist,
				and the class interface is OK,
				`an_element' is OK.
				]"
		local
			class_type: TBON_TC_CLASS_TYPE
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name, formal_type_context) then
					create class_type.make (an_element.name)
					add_to_formal_type_context (class_type)
					-- Resolve features for new type.
					resolve_features (class_type)

					-- Set status
					if an_element.is_root then
						class_type.set_is_root
					elseif an_element.is_deferred then
						class_type.set_is_deferred
					elseif an_element.is_effective then
						class_type.set_is_effective
					end

					if an_element.reused then
						class_type.set_is_reused
					end
					if an_element.persistent then
						class_type.set_is_persistent
					end
					if an_element.interfaced then
						class_type.set_is_interfaced
					end

					-- Check comment				
					if an_element.has_comment then
						Result := check_comment (an_element.comment) and Result
					end

					-- Check generics
					if an_element.has_generics then
						Result := check_formal_generics (an_element.generics, class_type) and Result
					end

					-- Check class interface
					if an_element.has_class_interface then
						Result := check_class_interface (an_element.class_interface, class_type) and Result
					end

				else
					add_error (err_code_class_exists, err_class_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				Result := True

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.name, formal_type_context) as a_class then
					-- Check generics
					if an_element.has_generics then
						Result := check_formal_generics (an_element.generics, a_class) and Result
					end
					-- Check class interface
					if an_element.has_class_interface then
						Result := check_class_interface (an_element.class_interface, a_class) and Result
					end
				else
					add_error (err_code_undefined, err_undefined ("Existing class ceased to exist."))
					Result := False
				end

			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not (class_type_exists (an_element.name, old formal_type_context))

			exists_in_environment:
			(first_phase and Result) implies class_type_exists (an_element.name, formal_type_context)

			effective_implies_deferred_parent:
				(second_phase and Result and
				an_element.has_class_interface and
				an_element.is_effective) implies
				not an_element.class_interface.parents.for_all (
					agent (a_class_type: CLASS_TYPE): BOOLEAN
						do
							if attached {TBON_TC_CLASS_TYPE} type_with_name (a_class_type.class_name, formal_type_context) as type then
								Result := not type.is_deferred
							else
								Result := False
							end
						end
				)
					-- not for_all parents it_holds not is_deferred = exists parent it_holds is_deferred

--			formal_generic_names_exist:
--				(second_phase and Result and an_element.has_generics) implies
--				an_element.generics.for_all (
--					agent (generic: FORMAL_GENERIC; class_spec: CLASS_SPECIFICATION): BOOLEAN
--						do
--							if attached {TBON_TC_CLASS_TYPE} type_with_name (class_spec.name, formal_type_context) as type then
--								Result := type.generics.range.exists (
--									agent (l_generic: FORMAL_GENERIC; tc_generic: TBON_TC_GENERIC): BOOLEAN
--										do
--											Result := tc_generic.formal_generic_name ~ l_generic.name
--										end (generic, ?)
--									)
--							else
--								Result := False
--							end
--						end (?, an_element)
--				)
					-- for_all generics in class specification exists generic name in corresponding TBON_TC_CLASS_TYPE

			has_class_interface_means_has_features:
			(second_phase and Result and an_element.has_class_interface) implies
				(attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.name, formal_type_context) as a_class and then
				 not a_class.features.is_empty)
		end

	check_class_type (an_element: CLASS_TYPE; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_type: TBON_TC_CLASS_TYPE; class_arg_no, type_arg_no: INTEGER): BOOLEAN
			-- Does `an_element' type check as a type CLASS_TYPE?
		note
			rule: "[
				In an environment where the name of `an_element' exists,
				and is not equal to its enclosing class
				and all the actual generics are OK,
				`an_element' is OK.
				]"
		require
			enclosing_class /= Void
			enclosing_type = Void implies class_arg_no > 0
			enclosing_type /= Void implies type_arg_no > 0
		local
			type: BON_TYPE
			current_type, bounding_type: TBON_TC_CLASS_TYPE
			actual_generics: ACTUAL_GENERICS
			type_arg: like type_arg_no
		do
			if first_phase then

				Result := True

--				-- A generic cannot be bounded by its enclosing class.
--				if an_element.class_name ~ enclosing_class.name then
--					-- Error - generic is bounded by its enclosing class
--					add_error (err_code_formal_generic_name_is_bounded_by_enclosing_class, err_formal_generic_name_is_bounded_by_enclosing_class (enclosing_class.generics[class_arg_no].formal_generic_name, enclosing_class.name))
--					Result := False
--				end

--				-- Iterate through actual generics
--				if an_element.actual_generic_count > 0 then

--					from an_element.actual_generics.start until an_element.actual_generics.after
--					loop
--						type := an_element.actual_generics.item_for_iteration
--						if type.is_class_type then
--							Result := check_class_type (type.class_type, enclosing_class, Void, class_arg_no, type_arg_no + 1)
--						elseif type.is_class_type then
--							Result := check_formal_generic_name (type.formal_generic_name, enclosing_class, Void, class_arg_no, type_arg_no + 1)
--						end

--						an_element.actual_generics.forth
--					end
--				end

			elseif second_phase then

				Result := True

				-- Check that class name exists in context
				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.class_name, formal_type_context) as class_type then
					if an_element.actual_generic_count > 0 then
						current_type := class_type.new_instance
					else
						current_type := class_type
					end

					-- A generic cannot be bounded by its enclosing class.
					if Result and then an_element.class_name ~ enclosing_class.name then
						-- Error - generic is bounded by its enclosing class
						add_error (err_code_formal_generic_name_is_bounded_by_enclosing_class, err_formal_generic_name_is_bounded_by_enclosing_class (enclosing_class.generics[class_arg_no].formal_generic_name, enclosing_class.name))
						Result := False
					end

					-- Check that number of arguments match for current element and class extracted from context.
					if Result and then not (current_type.generics.count = an_element.actual_generic_count) then
						-- Error - number of paramters do not match
						add_error (err_code_number_of_type_parameters_do_not_match, err_number_of_type_parameters_do_not_match (current_type.name, an_element.class_name))
						Result := False
					end
				elseif enclosing_class.generics.front (class_arg_no-1).range.exists (
							agent (l_generic: TBON_TC_GENERIC; l_generic_name: STRING): BOOLEAN
								do Result := l_generic.formal_generic_name ~ l_generic_name end (?, an_element.class_name)
						) then -- As formal generic names are not recognized by the parser, check it here.
					bounding_type := enclosing_class.generics[enclosing_class.index_of_generic_name (an_element.class_name)].bounding_type
					if bounding_type /= Void then
						current_type := bounding_type.new_instance
					else
						current_type ?= type_with_name (any_type_name, formal_type_context)
					end
				else
					-- Error - class does not exist
					add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.class_name))
					Result := False
				end

				-- If current_type is not enclosed by another type, add it as bounding type.
				-- Otherwise, set it as actual type.
				if Result then
					if enclosing_type = Void then
						enclosing_class.generics[class_arg_no].set_bounding_type (current_type)
					else
						enclosing_type.generics[type_arg_no].set_actual_type (current_type)
					end
				end

				if Result and then an_element.actual_generic_count > 0 then
					actual_generics := an_element.actual_generics
					from
						actual_generics.start
						type_arg := 1
					until
						actual_generics.after
					loop
						type := actual_generics.item_for_iteration
						if type.is_class_type then
							Result := check_class_type (type.class_type, enclosing_class, current_type, class_arg_no, type_arg)

						elseif type.is_formal_generic_name then
							Result := check_formal_generic_name (type.formal_generic_name, enclosing_class, current_type, class_arg_no, type_arg)
						end

						type_arg := type_arg + 1
						actual_generics.forth
					end

					-- Check that actual type conforms to bound
					unresolved_conformance.extend (create {TBON_TC_TUPLE[TBON_TC_CLASS_TYPE, INTEGER]}.make (current_type, type_arg_no))
--					if not current_type.generics[type_arg_no].is_valid_actual_type (current_type.generics[type_arg_no].actual_type) then
--						-- Error - actual type does not conform to bounding type.
--						add_error (err_code_actual_type_does_not_match_bounding_type, err_actual_type_does_not_match_bounding_type (current_type.generics[type_arg_no].formal_generic_name, current_type.generics[type_arg_no].actual_type.name, current_type.name))
--						Result := False
--					end
				end
			else
				Result := False
			end
		ensure
			not_bounded_by_enclosing_class:
			(second_phase and Result) implies not (an_element.class_name ~ enclosing_class.name)

			class_name_exists:
			(second_phase and Result) implies (class_type_exists (an_element.class_name, formal_type_context) or else
												enclosing_class.has_generic_name (an_element.class_name))
		end

	check_client_entities (an_element: CLIENT_ENTITIES; client_class: TBON_TC_CLASS_TYPE; relation: CLIENT_RELATION): BOOLEAN
			-- Does `an_element' type check as a type CLIENT_ENTITIES?
		note
			rule: "[
				In an environment where each entity of `an_element' is a feature name,
				a supplier indirection or a parent indirection,
				`an_element' is OK.
				]"
		do
			Result := True
			from
				an_element.start
			until
				an_element.after
			loop
				Result := Result and check_client_entity (an_element.item_for_iteration, client_class, relation)
			end
		end

	check_client_entity (an_element: CLIENT_ENTITY; client_class: TBON_TC_CLASS_TYPE; relation: CLIENT_RELATION): BOOLEAN
			-- Does `an_element' type check as a type CLIENT_ENTITY?
		note
			rule: "[
				In an environment where `an_element' is a feature name,
				a supplier indirection or a parent indirection,
				`an_element' is OK.
				]"
		do
			if attached {FEATURE_NAME} an_element as feature_name then
				Result := check_feature_name (feature_name, client_class)

			elseif attached {SUPPLIER_INDIRECTION} an_element as supplier_indirection then
				Result := check_supplier_indirection (supplier_indirection, client_class)

			elseif attached {PARENT_INDIRECTION} an_element as parent_indirection then
				Result := check_generic_indirection (parent_indirection, client_class)
			else
				Result := False
			end

		ensure
			feature_name_is_in_enclosing_class:
				(second_phase and Result) implies (attached {FEATURE_NAME} an_element as l_feature_name implies
					client_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix) /= Void)
		end

	check_client_relation (an_element: CLIENT_RELATION): BOOLEAN
			-- Does `an_element' type check as a type CLIENT_RELATION?
		note
			rule: "[
				In an environment where client and supplier references are OK,
				and the client entities of `an_element' are OK,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				-- Mark static refs as unresolved
				unresolved_static_references.extend (an_element.client)
				unresolved_static_references.extend (an_element.supplier)

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.client.class_name, formal_type_context) as client_class then
					-- Check client entities
					Result := Result and check_client_entities (an_element.client_entities, client_class, an_element)
				else
					add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.client.class_name))
					Result := False
				end

				-- Check multiplicity for shared type mark
				if an_element.has_type_mark and then an_element.type_mark.shared then
					Result := Result and check_multiplicity (an_element.type_mark.multiplicity)
				end

			else
				Result := False
			end
		end

	check_cluster_specification (an_element: CLUSTER_SPECIFICATION): BOOLEAN
			-- Does `an_element' type check as a type CLUSTER_SPECIFICATION?
		note
			rule: "[
				In an environment where `an_element' exists and has a unique name,
				and all components are OK and has `an_element' as parent,
				`an_element' is OK.
				]"
		local
			current_cluster: TBON_TC_CLUSTER_TYPE
			cluster_type: TBON_TC_CLUSTER_TYPE
			current_component: STATIC_COMPONENT
		do
			if first_phase then

				-- Add cluster to environment
				if not name_exists_in_context (an_element.name, formal_type_context) then

					-- Error name already exists
					add_error (err_code_cluster_exists, err_cluster_exists (an_element.name))
					Result := False

				else
					create cluster_type.make (an_element.name)

					if an_element.reused then
						cluster_type.set_is_reused
					end

					add_to_formal_type_context (cluster_type)
				end

			elseif second_phase then

				Result := True

				-- If cluster has components
				if an_element.has_components then

					if attached {TBON_TC_CLUSTER_TYPE} type_with_name (an_element.name, formal_type_context) as cluster then
						current_cluster := cluster
					end

					-- Set parents
					from
						an_element.components.start
					until
						an_element.components.after
					loop
						current_component := an_element.components.item_for_iteration

						if attached {CLASS_SPECIFICATION} current_component as class_spec then
							if attached {TBON_TC_CLASS_TYPE} type_with_name (class_spec.name, formal_type_context) as class_type then
								if class_type.cluster = Void then
									class_type.set_cluster (current_cluster)
								else
									add_error (err_code_class_already_in_cluster, err_class_already_in_cluster (current_cluster.name, class_type.name, class_type.cluster.name))
									Result := False
								end
							else
								add_error (err_code_class_does_not_exist, err_class_does_not_exist (class_spec.name))
								Result := False
							end
						elseif attached {CLUSTER_SPECIFICATION} current_component as cluster_spec then
							if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster_spec.name, formal_type_context) as cluster then
								if cluster.parent = Void then
									cluster.set_parent (current_cluster)
								else
									add_error (err_code_cluster_already_in_cluster, err_cluster_already_in_cluster (current_cluster.parent.name, cluster.name, cluster.parent.name))
									Result := False
								end
							else
								add_error (err_code_cluster_does_not_exist, err_cluster_does_not_exist (cluster_spec.name))
								Result := False
							end
						end
					end

					Result := check_static_block (an_element.components) and Result

				end

			else
				Result := False
			end
		ensure
			not_in_old_environment:
				(first_phase and Result) implies not (old formal_type_context.exists (
					agent (a_type: TBON_TC_TYPE; a_cluster: CLUSTER_SPECIFICATION): BOOLEAN
						do
							Result := a_type.name ~ a_cluster.name
						end (?, an_element))
					)

			exists_in_new_environment:
				(first_phase and Result) implies cluster_type_exists (an_element.name, formal_type_context)

			copmponents_exist_and_have_current_cluster_as_parent:
				(second_phase and Result and an_element.has_components) implies (an_element.components.for_all (
					agent (component: STATIC_COMPONENT; cluster_spec: CLUSTER_SPECIFICATION): BOOLEAN
						do
							Result := False
							if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster_spec.name, formal_type_context) as this_cluster then

								if attached {CLUSTER_SPECIFICATION} component as cluster then
									if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster.name, formal_type_context) as l_cluster_type then
										Result := l_cluster_type.parent ~ this_cluster
									end
								elseif attached {CLASS_SPECIFICATION} component as class_type then
									if attached {TBON_TC_CLASS_TYPE} type_with_name (class_type.name, formal_type_context) as l_class_type then
										Result := l_class_type.cluster ~ this_cluster
									end
								end

							end
						end (?, an_element)
					)
				)
		end

	check_contract_clause (an_element: CONTRACT_CLAUSE; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type CONTRACT_CLAUSE?
		note
			rule: "[
				In an environment where the precondition and the postcondition of `an_element' is OK,
				`an_element' is OK.
				]"
		do
			Result := True
			if an_element.has_precondition then
				Result := check_assertion (an_element.precondition, enclosing_class, enclosing_feature) and Result
			end
			if an_element.has_postcondition then
				Result := check_assertion (an_element.postcondition, enclosing_class, enclosing_feature) and Result
			end
		end

	check_extended_id (an_element: STRING): BOOLEAN
			-- Does `an_element' type check as a an extended ID?
		note
			rule: "[
				In an environment where `an_element' is either an integer or an identifier,
				`an_element' is OK.
				]"
		do
			Result := True
			-- If an extended ID exists more than once, emit a warning
			if extended_ids.has (an_element) then
				add_warning (warn_code_extended_id_exists, warn_extended_id_exists (an_element))
			end
			extended_ids.extend (an_element)
		end

	check_feature_arguments (an_element: FEATURE_ARGUMENT_LIST; enclosing_feature: TBON_TC_FEATURE; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
		note
			rule: "[
				In an environment where all arguments are OK,
				and if the feature is redefined all arguments conform to its precursors,
				`an_element' is OK.
				]"
		require
			enclosing_feature.arguments /= Void
		local
			argument: FEATURE_ARGUMENT
			l_argument: TBON_TC_FEATURE_ARGUMENT
			t_type: TBON_TC_CLASS_TYPE
			seen_argument_names: LIST[STRING]
			l_precursor: TBON_TC_FEATURE
			type_instance: TBON_TC_CLASS_TYPE
		do
			Result := True
			if first_phase then

				create {ARRAYED_LIST[STRING]} seen_argument_names.make (5)
				seen_argument_names.compare_objects

				-- Check all arguments in the argument list.
				from an_element.start until an_element.after loop
					argument := an_element.item_for_iteration

					from argument.identifiers.start until argument.identifiers.after
					loop
						-- Check for duplicate argument names
						if seen_argument_names.has (argument.identifiers.item_for_iteration) then
							add_error (err_code_duplicate_argument_name, err_duplicate_argument_name (argument.identifiers.item_for_iteration, enclosing_feature.name, enclosing_class.name))
							Result := False
						end
						seen_argument_names.extend (argument.identifiers.item_for_iteration.string)

						if argument.identifiers.item_for_iteration ~ enclosing_feature.name then
							add_error (err_code_argument_has_same_name_as_feature, err_argument_has_same_name_as_feature (argument.identifiers.item_for_iteration, enclosing_feature.name, enclosing_class.name))
							Result := False
						end

						argument.identifiers.forth
					end

					--  Argument is a class type
					if argument.type.is_class_type then
						-- Argument exists in context
						if attached {TBON_TC_CLASS_TYPE} type_with_name (argument.type.class_type.class_name, formal_type_context) as type then
							from argument.identifiers.start until argument.identifiers.after
							loop
								create l_argument.make (argument.identifiers.item_for_iteration.string, type)
								enclosing_feature.arguments.extend (l_argument)

								argument.identifiers.forth
							end
						-- Argument doesn't exist in context. Feature is unresolved.
						else
							from argument.identifiers.start until argument.identifiers.after
							loop
								create t_type.make (argument.type.class_type.class_name)
								create l_argument.make (argument.identifiers.item_for_iteration.string, t_type)
								enclosing_feature.arguments.extend (l_argument)

								argument.identifiers.forth
							end
							unresolved_features := unresolved_features.extended (enclosing_feature)
						end
					-- Argument is a formal generic
					elseif argument.type.is_formal_generic_name then
						Result := enclosing_class.has_generic_name (argument.type.formal_generic_name)
						-- Enclosing class doesn't a generic of this type.
						if not Result then
							add_error (err_code_argument_type_does_not_exist, err_argument_type_does_not_exist (argument.identifiers.first, enclosing_feature.name, enclosing_class.name))
							Result := False
						-- Enclosing class has a generic of this type.
						else
							from argument.identifiers.start until argument.identifiers.after
							loop
								create l_argument.make_with_formal_generic_name (argument.identifiers.item_for_iteration, argument.type.formal_generic_name)
								enclosing_feature.arguments.extend (l_argument)

								argument.identifiers.forth
							end
						end
					end
				end

			elseif second_phase then

				from an_element.start until an_element.after
				loop
					from an_element.item_for_iteration.identifiers.start until an_element.item_for_iteration.identifiers.after
					loop
						l_argument := enclosing_feature.argument_with_name (an_element.item_for_iteration.identifiers.item_for_iteration)

						-- Check type of argument
						if l_argument.has_type and then not l_argument.type.generics.is_empty then
							if an_element.item_for_iteration.type.is_class_type then
								type_instance := instantiated_type (l_argument.type, an_element.item_for_iteration.type.class_type, enclosing_class)
							end
						end

						an_element.item_for_iteration.identifiers.forth
					end

					an_element.forth
				end

				-- Check that types match precursor argument types
				l_precursor := enclosing_feature.nearest_precursor
				if l_precursor /= Void then
					Result := feature_arguments_conform (enclosing_feature, l_precursor)
					if not Result then
						add_error (err_code_argument_types_do_not_match_precursor, err_argument_types_do_not_match_precursor (enclosing_feature.name, l_precursor.name, enclosing_class.name))
					end
				else
					Result := False
				end

				-- Check that infix feature has exactly one argument
				if enclosing_feature.is_infix then
					if not (enclosing_feature.arguments.count = 1) then
						-- Error - infix feature must have two arguments
						add_error (err_code_infix_feature_must_have_one_argument, err_infix_feature_must_have_one_argument (enclosing_feature.name, enclosing_class.name))
						Result := False
					end
				end

			end
		end

	check_feature_clause (an_element: FEATURE_CLAUSE; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type FEATURE_CLAUSE?
		note
			rule: "[
				In an environment where all enclosed features specifications are OK,
				and all classes mentioned in the selective export exist,
				`an_element' is OK.
				]"
		local
			selective_export: CLASS_NAME_LIST
			feature_specifications: FEATURE_SPECIFICATION_LIST
		do
			if first_phase then

				Result := True

				from
					feature_specifications := an_element.feature_specifications
					feature_specifications.start
				until
					feature_specifications.after
				loop
					if an_element.has_selective_export then
						selective_export := an_element.selective_export
					end
					Result := check_feature_specification (feature_specifications.item_for_iteration, selective_export, enclosing_class) and Result

					feature_specifications.forth
				end

				if an_element.has_comment then
					Result := Result and check_comment (an_element.comment)
				end

				if an_element.has_selective_export then
					Result := check_selective_export (an_element.selective_export, enclosing_class) and Result
				end

			elseif second_phase then

				Result := True

				from
					feature_specifications := an_element.feature_specifications
					feature_specifications.start
				until
					feature_specifications.after
				loop
					if an_element.has_selective_export then
						Result := check_feature_specification (feature_specifications.item_for_iteration, an_element.selective_export, enclosing_class) and Result
					else
						Result := check_feature_specification (feature_specifications.item_for_iteration, Void, enclosing_class) and Result
					end

					feature_specifications.forth
				end

				if an_element.has_selective_export then
					Result := check_selective_export (an_element.selective_export, enclosing_class) and Result
				end

			end
		end

	check_feature_name (an_element: FEATURE_NAME; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type FEATURE_NAME?
		note
			rule: "[
				In an environment where `an_element' exists in enclosing class,
				`an_element' is OK.
				]"
		do
			if first_phase then
				Result := True
					-- Nothing to do for first phase.

			elseif second_phase then

				Result := enclosing_class.interface.exists (
					agent (l_feature: TBON_TC_FEATURE; l_name: STRING): BOOLEAN
						do
							Result := l_feature.name ~ l_name
						end (?, an_element.feature_name)
				)

				if not Result then
					add_error (err_code_feature_not_defined_in_class, err_feature_not_defined_in_class (an_element.feature_name, enclosing_class.name))
					Result := False
				end
			else
				Result := False
			end
		ensure
			feature_exists_in_class:
			(second_phase and Result) implies enclosing_class.feature_with_name (an_element.feature_name, an_element.is_prefix, an_element.is_infix) /= Void
		end


	check_feature_specification (an_element: FEATURE_SPECIFICATION; selective_export: CLASS_NAME_LIST; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type FEATURE_SPECIFICATION?
		note
			rule: "[
				In an environment where the names of `an_element' are unique in its enclosing class,
				and the type of the feature is in the environment,
				and all feature arguments are OK,
				and if renamed is renamed consistently,
				and the status (deferred/effective/redefined) of `an_element' is OK,
				and the contracts of `an_element' are OK,
				`an_element' is OK.
				]"
		require
			enclosing_class /= Void
		local
			l_feature: TBON_TC_FEATURE
			l_class_type: TBON_TC_CLASS_TYPE
			feature_names: FEATURE_NAME_LIST
			current_feature_name: FEATURE_NAME
			l_precursor: TBON_TC_FEATURE

			seen_feature_names: LIST[STRING]
			has_duplicates: BOOLEAN

			interface: MML_SET[TBON_TC_FEATURE]

			type_instance: TBON_TC_CLASS_TYPE
		do
			if first_phase then

				create {ARRAYED_LIST[STRING]} seen_feature_names.make (5)
				seen_feature_names.compare_objects

				Result := True
				-- Add types to features
				-- If type does not exist, add to unresolved types
				from
					feature_names := an_element.feature_names
					feature_names.start
				until
					feature_names.after
				loop
					current_feature_name := feature_names.item_for_iteration

					-- Check for duplicate feature names in class
					if seen_feature_names.has (current_feature_name.feature_name) then
						add_error (err_code_duplicate_feature_name, err_duplicate_feature_name (current_feature_name.feature_name, enclosing_class.name))
						Result := False
					end
					seen_feature_names.extend (current_feature_name.feature_name)

					-- Create feature
					create l_feature.make (current_feature_name.feature_name, Void, enclosing_class)

					-- Set prefix or infix status
					if current_feature_name.is_infix then
						l_feature.set_is_infix
					elseif current_feature_name.is_prefix then
						l_feature.set_is_prefix
					end
					-- Set feature status
					if an_element.is_deferred then
						l_feature.set_is_deferred
					elseif an_element.is_effective then
						l_feature.set_is_effective
					elseif an_element.is_redefined then
						l_feature.set_is_redefined
					end
					-- Set visibility
					if selective_export /= Void then
						selective_export.do_all (agent (class_name: STRING; l_l_feature: TBON_TC_FEATURE) do l_l_feature.selective_export.extend (class_name) end (?, l_feature))
					end

					-- Check that prefix feature has no arguments
					if current_feature_name.is_prefix and an_element.has_arguments then
						-- Error - prefix feature has arguments
						add_error (err_code_prefix_feature_has_argument, err_prefix_feature_has_argument (current_feature_name.feature_name, enclosing_class.name))
						Result := False
					end

					-- Check if the type of the feature exists - else, mark it as unresolved
					if an_element.has_type and then an_element.type.is_class_type then

						if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.type.class_type.class_name, formal_type_context) as class_type then
							-- Set type as type exists
							l_feature.set_type (class_type)

						else -- The type of the feature is not known yet
							-- Create placeholder type
							create l_class_type.make (an_element.type.class_type.class_name)

							-- Set placeholder type as type
							l_feature.set_type (l_class_type)

							-- Add feature to unresolved features
							unresolved_features := unresolved_features & l_feature
						end

					elseif an_element.has_type and then an_element.type.is_formal_generic_name then
						-- If enclosing class has generics
						if not enclosing_class.generics.is_empty then
							-- and the formal generics name exists in enclosing class.
							if enclosing_class.has_generic_name (an_element.type.formal_generic_name) then
								l_feature.set_formal_generic_name (an_element.type.formal_generic_name)
							else
								add_error (err_code_formal_generic_name_does_not_exist, err_formal_generic_name_does_not_exist (current_feature_name.feature_name, an_element.type.formal_generic_name, enclosing_class.name))
								Result := False
							end
						else
							add_error (err_code_enclosing_class_not_generic, err_enclosing_class_not_generic (current_feature_name.feature_name, an_element.type.formal_generic_name, enclosing_class.name))
							Result := False
						end
					end

					-- Add feature to enclosing class
					if enclosing_class.feature_with_name (current_feature_name.feature_name, current_feature_name.is_prefix, current_feature_name.is_infix) = Void then
						enclosing_class.add_feature (l_feature)
					else
						add_error (err_code_duplicate_feature_name, err_duplicate_feature_name (current_feature_name.feature_name, enclosing_class.name))
						Result := False
					end

					feature_names.forth
				end

				-- Check that feature does not introduce aggregation with enclosing class.
				if an_element.has_type and then an_element.type_mark.aggregate and an_element.type.is_class_type then
					if enclosing_class.name ~ an_element.type.class_type.class_name then
						add_error (err_code_feature_introduces_aggregation_with_enclosing_class, err_feature_introduces_aggregation_with_enclosing_class (an_element.feature_names.first.feature_name, enclosing_class.name))
						Result := False
					end
				end

				-- Check feature arguments
				if Result and an_element.has_arguments then
					Result := check_feature_arguments (an_element.arguments, l_feature, enclosing_class) and Result
				end

			elseif second_phase then

				Result := True

				from
					feature_names := an_element.feature_names
					feature_names.start
				until
					feature_names.after
				loop
					current_feature_name := feature_names.item_for_iteration
					l_feature := enclosing_class.feature_with_name (current_feature_name.feature_name, current_feature_name.is_prefix, current_feature_name.is_infix)

					-- Check type of feature
					if l_feature.has_type and then not l_feature.type.generics.is_empty then
						if an_element.type.is_class_type and then an_element.type.class_type.actual_generic_count > 0 then
							type_instance := instantiated_type (l_feature.type, an_element.type.class_type, enclosing_class) --l_feature.type.new_instance
							l_feature.set_type (type_instance)
							--Result := check_class_type (an_element.type.class_type, enclosing_class, l_feature.type, 0, 1)
						end
					end

					-- Get precursor
					l_precursor := l_feature.nearest_precursor

					-- If current feature is redefined, a precursor must exist
					if an_element.is_redefined and l_precursor = Void then
						add_error (err_code_no_precursor_exists_for_feature, err_no_precursor_exists_for_feature (current_feature_name.feature_name, enclosing_class.name))
						Result := False
					end

					-- If precursor exists, the type of current feature must conform to type of precursor
					if l_precursor /= Void and then l_feature.has_type and then not l_feature.type.conforms_to (l_precursor.type) then
						-- Error type does not conform to precursor.
						Result := False
					end

					-- If precursor is deferred, current feature must be effective or deferred
					if l_precursor /= Void and then l_precursor.is_deferred then
						if not l_feature.is_effective and not l_feature.is_deferred then
							-- Error - non-deferred feature with deferred precursor must be effective or deferred
						end
					end

					-- Do status-specific checking
					if an_element.is_deferred then

						if not enclosing_class.is_deferred then
							-- Error enclosing class must be deferred.
							add_error (err_code_non_deferred_class_has_deferred_feature, err_non_deferred_class_has_deferred_feature (enclosing_class.name, current_feature_name.feature_name))
							Result := False
						end

					elseif an_element.is_effective then

						if l_precursor /= Void then
							if not l_precursor.is_deferred then
								-- Error effective feature redefines non-deferred feature - mark as redefined.
								add_error (err_code_effective_feature_has_non_deferred_precursor, err_effective_feature_has_non_deferred_precursor (current_feature_name.feature_name, enclosing_class.name))
								Result := False
							end
						end
						-- If feature has no precursor, it can always be marked as effective to emphasize implementation.

					elseif an_element.is_redefined then

						if l_precursor /= Void then
							if l_precursor.is_deferred then
								-- Error - feature should be marked as effective, not redefined.
								add_error (err_code_redefined_feature_has_deferred_precursor, err_redefined_feature_has_deferred_precursor (current_feature_name.feature_name, enclosing_class.name))
								Result := False
							end
						end

					elseif not an_element.has_status then

						if l_precursor /= Void then
							-- Error - unclassified feature has precursor.
							add_error (err_code_unclassified_feature_has_precursor, err_unclassified_feature_has_precursor (current_feature_name.feature_name, enclosing_class.name))
							Result := False
						end
					end

					-- Check for duplicate feature names in inheritance hierarchy
--					interface := enclosing_class.interface
--					has_duplicates := interface.exists (
--						agent (set_feature, other_feature: TBON_TC_FEATURE): BOOLEAN
--							do
--								Result := set_feature.name ~ other_feature.name and then ((not (set_feature |=| other_feature)) and
--										  ((set_feature.is_deferred and other_feature.is_redefined) or
--										   (set_feature.is_deferred and other_feature.is_unclassified) or
--										   (set_feature.is_effective and other_feature.is_unclassified) or
--										   (set_feature.is_effective and other_feature.is_effective) or
--										   (set_feature.is_redefined and other_feature.is_unclassified) or
--										   (set_feature.is_unclassified and other_feature.is_effective) or
--										   (set_feature.is_unclassified and other_feature.is_unclassified)
--										   ) and
--										  (set_feature.is_prefix implies other_feature.is_prefix) and
--										  (set_feature.is_infix implies other_feature.is_infix))
--							end (?, l_feature)
--					)
--					if has_duplicates then
--						-- Error - duplicate feature name as a result of inheritance.
--						add_error (err_code_duplicate_feature_name_inherited, err_duplicate_feature_name_inherited (current_feature_name.feature_name, enclosing_class.name))
--						Result := False
--					end

					feature_names.forth
				end

				-- Check renaming

				-- Check arguments
				if Result and an_element.has_arguments then
					Result := check_feature_arguments (an_element.arguments, l_feature, enclosing_class) and Result
				end

				-- Check contract clause
				if Result and an_element.has_contract then
					Result := check_contract_clause (an_element.contracts, enclosing_class, l_feature) and Result
				end

			else
				Result := False
			end
		ensure
--			features_not_in_old_environment:
--			(first_phase and Result) implies an_element.feature_names.for_all (
--				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
--					do
--						Result := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix) = Void
--					end (?, (old enclosing_class))
--			)

			features_in_new_environment:
			(first_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					do
						Result := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix) /= Void
					end (?, enclosing_class)
			)

			feature_type_in_environment:
			(second_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					do
						Result := class_type_exists (l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).type.name, formal_type_context) xor
									l_enclosing_class.has_generic_name (l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).formal_generic_name)
					end (?, enclosing_class)
			)

			feature_type_conforms_to_precursor_type:
			(an_element.has_type and second_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					local
						l_l_precursor: TBON_TC_FEATURE
						l_l_feature: TBON_TC_FEATURE
					do
						l_l_feature := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix)
						l_l_precursor := l_l_feature.nearest_precursor
						if l_l_precursor /= Void then
							Result := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).has_type implies l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).type.conforms_to (l_l_precursor.type)
						else
							Result := True
						end
					end (?, enclosing_class)
			)

			deferred_feature_means_deferred_class:
			(an_element.is_deferred and second_phase and Result) implies enclosing_class.is_deferred

			effective_means_deferred_or_no_precursor:
			(an_element.is_effective and second_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					local
						l_l_precursor: TBON_TC_FEATURE
					do
						l_l_precursor := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).nearest_precursor
						Result := (l_l_precursor /= Void implies l_l_precursor.is_deferred) or l_l_precursor = Void
					end (?, enclosing_class)
			)

			redefined_means_non_deferred_precursor:
			(an_element.is_redefined and second_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					local
						l_l_precursor: TBON_TC_FEATURE
					do
						l_l_precursor := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix).nearest_precursor
						Result := l_l_precursor /= Void and then not l_l_precursor.is_deferred
					end (?, enclosing_class)
			)

			deferred_precursor_means_deferred_or_effective:
			(second_phase and Result) implies an_element.feature_names.for_all (
				agent (l_feature_name: FEATURE_NAME; l_enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
					local
						l_l_precursor: TBON_TC_FEATURE
						l_l_feature: TBON_TC_FEATURE
					do
						l_l_feature := l_enclosing_class.feature_with_name (l_feature_name.feature_name, l_feature_name.is_prefix, l_feature_name.is_infix)
						l_l_precursor := l_l_feature.nearest_precursor
						Result := (l_l_precursor /= Void and then l_l_precursor.is_deferred) implies (l_l_feature.is_deferred or l_l_feature.is_effective)
					end (?, enclosing_class)
			)
		end

	check_formal_generic (an_element: FORMAL_GENERIC; enclosing_class: TBON_TC_CLASS_TYPE; arg_no: INTEGER): BOOLEAN
			-- Does `an_element' type check as a type FORMAL_GENERIC?
		note
			rule: "[
				In an environment where the formal generic name is unique for the class,
				and the class type, if present, is OK,
				`an_element' is OK.
				]"
		local
			generic: TBON_TC_GENERIC
			class_type: TBON_TC_CLASS_TYPE
			actual_generics: ACTUAL_GENERICS
			current_class_type: CLASS_TYPE
			--is_unique_name: BOOLEAN
		do
			if first_phase then

				Result := True

				if an_element.has_class_type then
					Result := check_class_type (an_element.class_type, enclosing_class, Void, arg_no, 1) and Result
					-- Create placeholder bounding type
					create class_type.make (an_element.class_type.class_name)
				end

				create generic.make (an_element.name, class_type)
				-- Add as unresolved
				unresolved_generics.extend (create {TBON_TC_TUPLE[TBON_TC_GENERIC, TBON_TC_CLASS_TYPE]}.make (generic, enclosing_class))

			elseif second_phase then

--				Result := not formal_type_context.exists (
--					agent (type: TBON_TC_TYPE; l_generic_name: STRING): BOOLEAN
--						do
--							Result := type.name ~ l_generic_name
--						end (?, an_element.name)
--				)

--				if Result then
--					is_unique_name := not enclosing_class.generics.range.exists (
--						agent (l_generic: TBON_TC_GENERIC; l_generic_name: STRING): BOOLEAN
--							do
--								Result := l_generic.formal_generic_name ~ l_generic_name
--							end (?, an_element.name)
--					)

--					if is_unique_name then
--						create generic.make (an_element.name, Void)
--						enclosing_class.add_type_parameter (generic)
--					else
--						-- Error - formal generic name appears more than once in class specification
--						add_error (err_code_formal_generic_name_appears_more_than_once, err_formal_generic_name_appears_more_than_once (an_element.name, enclosing_class.name))
--						Result := False
--					end
--				else
--					add_error (err_code_formal_generic_name_has_same_name_as_class, err_formal_generic_name_has_same_name_as_class (an_element.name, enclosing_class.name))
--					Result := False
--				end

				Result := True

				if an_element.has_class_type then
					Result := check_class_type (an_element.class_type, enclosing_class, Void, arg_no, 1) and Result
				end

			else
				Result := False
			end

		ensure
			formal_generic_name_not_in_old_environment:
				(first_phase and Result) implies not (old enclosing_class.generics.range).exists (
					agent (l_generic: TBON_TC_GENERIC; l_generic_name: STRING): BOOLEAN
						do
							Result := l_generic.formal_generic_name ~ l_generic_name
						end (?, an_element.name)
				)

--			formal_generic_name_in_new_environment:
--				(second_phase and Result) implies enclosing_class.generics.range.exists (
--					agent (l_generic: TBON_TC_GENERIC; l_generic_name: STRING): BOOLEAN
--						do
--							Result := l_generic.formal_generic_name ~ l_generic_name
--						end (?, an_element.name)
--				)
		end

	check_formal_generic_name (an_element: STRING; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_type: TBON_TC_CLASS_TYPE; class_arg_no, type_arg_no: INTEGER): BOOLEAN
			-- Does `an_element' type check as a type FORMAL_GENERIC_NAME?
		note
			rule: "[
				In an environment where `an_element' is not bounded by itself,
				and the type bound of `an_element' conforms to the type instantiation in which it participates,
				`an_element' is OK.
				]"
		local
			elem_index: INTEGER
		do
			if first_phase then

				Result := True

				-- Check that formal generic name is not bounded by itself.
				-- E.g. E -> LIST[E]
				if enclosing_class.generics[class_arg_no].formal_generic_name ~ an_element then
					-- Error - formal generic name is bounded by itself.
					Result := False
				end

			elseif second_phase then

				Result := True

				if enclosing_class.has_generic_name (an_element) then
					elem_index := enclosing_class.index_of_generic_name (an_element)
					if (elem_index < class_arg_no and class_arg_no > 0) or class_arg_no = 0 then
						-- Check that formal generic name participates consistently in bound
						if not enclosing_type.generics[type_arg_no].is_valid_actual_type (enclosing_class.generics[elem_index].bounding_type) then
							-- Error - Bound of formal generic name does not conform to bound of enclosing type
							Result := False
						end
					else
						-- Error - formal generic name appears before its definition
						Result := False
					end
				else
					-- Error - formal generic name does not exist in enclosing class
					Result := False
				end

			else
				Result := True
			end
		ensure
			not_bounded_by_itself:
			(first_phase and Result) implies not (enclosing_class.generics[class_arg_no].formal_generic_name ~ an_element)
		end

	check_formal_generics (an_element: FORMAL_GENERIC_LIST; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type FORMAL_GENERIC_LIST?
		note
			rule: "[
				In an environment where all contained formal generics are OK,
				`an_element' is OK.
				]"
		local
			arg_no: INTEGER
		do
			if first_phase then

				Result := True

				arg_no := 1

				from an_element.start until an_element.after
				loop
					Result := check_formal_generic (an_element.item_for_iteration, enclosing_class, arg_no) and Result
					arg_no := arg_no + 1
					an_element.forth
				end

			elseif second_phase then

				Result := True

				arg_no := 1

				from an_element.start until an_element.after
				loop
					Result := check_formal_generic (an_element.item_for_iteration, enclosing_class, arg_no) and Result
					arg_no := arg_no + 1
					an_element.forth
				end

			else
				Result := False
			end
		end

	check_generic_indirection (an_element: GENERIC_INDIRECTION; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type GENERIC_INDIRECTION?
		note
			rule: "[
				In an environment where is a formal generic name or a named indirection,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
					-- Nothing to do for first phase.

			elseif second_phase then

				Result := True

				if an_element.is_formal_generic_name then
					Result := check_formal_generic_name (an_element.formal_generic_name, enclosing_class, Void, 0, 0)
				elseif an_element.is_named_indirection then
					Result := check_named_indirection (an_element.named_indirection)
				end

			else
				Result := False
			end
		end

	check_indirection_list (an_element: INDIRECTION_LIST; indirection: NAMED_INDIRECTION): BOOLEAN
			-- Does `an_element' type check as a type ASSERTION_CLAUSE_LIST?
		note
			rule: "[
				In an environment where each element of `an_element' is either named indirection
				or a unspecified/ellipses element,
				`an_element' is OK.
				]"
		local
			arg_no: INTEGER
		do
			if first_phase then
				Result := True
						-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				from
					an_element.start
					arg_no := 1
				until
					an_element.after
				loop
					if not an_element.item_for_iteration.ellipses then
						Result := check_named_indirection (an_element.item_for_iteration.named_indirection)
						-- Get enclosing class
						if Result and indirection.has_class_name and then attached {TBON_TC_CLASS_TYPE} type_with_name (indirection.class_name, formal_type_context) as enclosing_class then
							-- Get indirection class
							if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.item_for_iteration.class_name, formal_type_context) as indirection_class then
								-- Check that type conforms to bound of type parameter of enclosing type.
								if not enclosing_class.generics[arg_no].is_valid_actual_type (indirection_class) then
									add_error (err_code_actual_type_does_not_match_bounding_type, err_actual_type_does_not_match_bounding_type (enclosing_class.generics[arg_no].formal_generic_name, indirection_class.name, enclosing_class.name))
									Result := False
								end
							end
						end
					end
						-- If current item is an ellipses placeholder, do nothing.
					arg_no := arg_no + 1
					an_element.forth
				end

			else
				Result := False
			end
		end

	check_inheritance_relation (an_element: INHERITANCE_RELATION): BOOLEAN
			-- Does `an_element' type check as a type INHERITANCE_RELATION?
		note
			rule: "[
				In an environment where both the Child and the Parent of `an_element' are OK,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				unresolved_static_references.extend (an_element.child)
				unresolved_static_references.extend (an_element.parent)
				unresolved_inheritance_relations.extend (an_element)
				Result := check_multiplicity (an_element.multiplicity) and Result

			else
				Result := False
			end
		end

	check_multiplicity (an_element: INTEGER): BOOLEAN
			-- Does `an_element' type check as a multiplicity?
		note
			rule: "[
				In an environment where `an_element is greater than zero, `an_element is OK.
				]"
		do
			Result := an_element > 0
			if not Result then
				-- Error - given multiplicity is invalid
			end
		ensure
			Result implies an_element > 0
		end

	check_named_indirection (an_element: NAMED_INDIRECTION): BOOLEAN
			-- Does `an_element' type check as a type NAMED_INDIRECTION?
		note
			rule: "[
				In an environment where the class name of `an_element' exists in the environment,
				and the number of indirection elements match the parameters of the class name,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
						-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				if an_element.has_class_name then
					-- Check that class name exists
					if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.class_name, formal_type_context) as class_type then
						if an_element.has_indirection_list then
							if not (class_type.generics.count = an_element.indirection_list.count) then
								add_error (err_code_number_of_parameters_in_named_indirection_does_not_match_number_of_type_parameters_in_class,
											err_number_of_parameters_in_named_indirection_does_not_match_number_of_type_parameters_in_class (an_element.class_name, class_type.name))
								Result := False
							end
						end
					else
						add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.class_name))
						Result := False
					end
				end

				if an_element.has_indirection_list then
					Result := Result and check_indirection_list (an_element.indirection_list, an_element)
				end

			else
				Result := False
			end
		ensure
			class_name_exists:
			(second_phase and Result) implies class_type_exists (an_element.class_name, formal_type_context)
		end

	check_selective_export (an_element: CLASS_NAME_LIST; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type CLASS_NAME_LIST?
		note
			rule: "[
				In an environment where all the classes mentioned in the selective export exist,
				or are otherwise allowable (e.g. NONE),
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
					-- Nothing to be checked for first phase

			elseif second_phase then

				Result := True

				from an_element.start until an_element.after
				loop
					if not class_type_exists (an_element.item_for_iteration, formal_type_context) and
						not (an_element.item_for_iteration ~ none_type_name) then
						add_error (err_code_selective_export_class_does_not_exist, err_selective_export_class_does_not_exist (an_element.item_for_iteration, enclosing_class.name))
						Result := False
					end
					an_element.forth
				end

			else
				Result := False
			end
		ensure
			all_selective_export_classes_exist:
			an_element.for_all (
				agent (export_class_name: STRING): BOOLEAN
					do
						Result := class_type_exists (export_class_name, formal_type_context) xor
									export_class_name ~ none_type_name
					end
			)
				-- For all classes it holds that it exists in the environment or is of type NONE.
		end

	check_static_block (some_elements: STATIC_COMPONENTS): BOOLEAN
			-- Does each element in `some_elements' type check as their respective types?
		note
			rule: "[
				In an environment where all contained components are OK,
				`some_elements' are OK.
				]"
		local
			component: STATIC_COMPONENT
		do
			Result := True
			from
				some_elements.start
			until
				some_elements.after
			loop
				component := some_elements.item_for_iteration
				if attached {CLUSTER_SPECIFICATION} component as cluster_spec then
					Result := check_cluster_specification (cluster_spec) and Result
				elseif attached {CLASS_SPECIFICATION} component as class_spec then
					Result := check_class_specification (class_spec) and Result
				elseif attached {STATIC_RELATION} component as relation then
					Result := check_static_relation (relation) and Result
				else
					Result := False
				end

				some_elements.forth
			end
		end

	check_static_diagram (an_element: STATIC_DIAGRAM): BOOLEAN
			-- Does `an_element' type check as a type STATIC_DIAGRAM?
		note
			rule: "[
				In an environment where the comment and extended ID of `an_element' are OK,
				and all static components of `an_element' are OK,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
				if an_element.has_comment then
					Result := Result and check_comment (an_element.comment)
				end
				if an_element.has_name then
					Result := Result and check_extended_id (an_element.name)
				end
				if an_element.has_components then
					Result := check_static_block (an_element.components)
				end

			elseif second_phase then

				Result := True

				if an_element.has_components then
					Result := check_static_block (an_element.components)
				end

			else
				Result := False
			end
		ensure
			(first_phase and Result and an_element.has_comment) implies check_comment (an_element.comment)
			(first_phase and Result and an_element.has_name) implies extended_ids.has (an_element.name)
		end

	check_static_relation (an_element: STATIC_RELATION): BOOLEAN
			-- Does `an_element' type check as a type STATIC_RELATION?
		note
			rule: "[
				In an environment where `an_element' is either an inheritance relation or
				client relation, `an_element' is OK.
				]"
		do
			if attached {INHERITANCE_RELATION} an_element as inheritance_relation then
				Result := check_inheritance_relation (inheritance_relation)
			elseif attached {CLIENT_RELATION} an_element as client_relation then
				Result := check_client_relation (client_relation)
			else
				Result := False
			end
		end

	check_static_reference (an_element: STATIC_REF): BOOLEAN
			-- Does `an_element' type check as a type STATIC_REF?
		note
			rule: "[
				In an environment where the class of `an_element' exists,
				and the cluster prefix of `an_element' is consistent with the cluster hierarchy,
				`an_element' is OK.
				]"
		local
			cluster_index: INTEGER
			current_cluster: TBON_TC_CLUSTER_TYPE
		do
			if first_phase then

				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.class_name, formal_type_context) as class_type then

					from
						cluster_index := an_element.clusters_count
						current_cluster := class_type.cluster
					until
						cluster_index < 1 or current_cluster = Void
					loop
						if attached {TBON_TC_CLUSTER_TYPE} type_with_name (an_element.cluster (cluster_index), formal_type_context) then
							if not (current_cluster.name ~ an_element.cluster (cluster_index)) then
								-- Error - cluster in static reference does not match cluster for class exist
								Result := False
							end
						else
							-- Error - cluster in prefix does not exist
							Result := False
						end

						current_cluster := current_cluster.parent
						cluster_index := cluster_index - 1
					end

				else
					-- Error - class does not exist
					add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.class_name))
					Result := False
				end

			else
				Result := False
			end
		end

	check_supplier_indirection (an_element: SUPPLIER_INDIRECTION; client_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type BOOLEAN_EXPRESSION?
		note
			rule: "[
				In an environment where, if present, all the indirection features of `an_element' 
				exist in the client class,
				and the generic indirection is OK,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
						-- Nothing to be done for first phase.

			elseif second_phase then

				Result := an_element.indirection_feature_part.for_all (agent check_feature_name (?, client_class))

				Result := Result and check_generic_indirection (an_element.generic_indirection, client_class)

			else
				Result := False
			end
		end


feature -- Type checking, formal assertions

	check_assertion (an_element: ASSERTION_CLAUSE_LIST; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type ASSERTION_CLAUSE_LIST?
		note
			rule: "[
				In an environment where `an_element' is a boolean expression or an assertion comment,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := False

			elseif second_phase then

				from
					an_element.start
				until
					an_element.after
				loop
					-- Clear scope for new assertion
					variable_context.wipe_out

					if attached {BOOLEAN_EXPRESSION} an_element.item_for_iteration as bool_expression then
						Result := check_boolean_expression (bool_expression, enclosing_class, enclosing_feature) and Result

					elseif attached {ASSERTION_COMMENT} an_element.item_for_iteration as comment then
						Result := check_comment (comment) and Result
					end

					an_element.forth
				end

			else
				Result := False
			end
		end

	check_binary_expression (an_element: BINARY_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type BINARY_EXPRESSION?
		note
			rule: "[
				In an environment where the type of the left expression of `an_element' has
				an infix feature that matches the operator of `an_element',
				and the type of the right expression of `an_element' conforms to the
				type of the input to that infix feature,
				`an_element' is OK.
				]"
		local
			left_type, right_type: TBON_TC_CLASS_TYPE
			infix_feature: TBON_TC_FEATURE
		do
			Result := True
			left_type := type_of_expression (an_element.left_expression, enclosing_class, enclosing_feature)
			right_type := type_of_expression (an_element.right_expression, enclosing_class, enclosing_feature)
			infix_feature := left_type.interface_feature_with_name (an_element.operator.string_representation, False, True)

			if infix_feature /= Void then
				if not right_type.conforms_to (infix_feature.arguments.first.type) then -- A correct infix feature has only one argument
					-- Error - input type does not conform to argument type
					add_error (err_code_input_type_does_not_conform_to_argument_type, err_input_type_does_not_conform_to_argument_type (infix_feature.enclosing_class.name, infix_feature.name, infix_feature.arguments.first.formal_name, right_type.name))
					Result := False
				end
			else
				-- Error - left type has no infix feature assigned for 'operator'
				add_error (err_code_infix_feature_not_defined_in_class, err_infix_feature_not_defined_in_class (an_element.operator.string_representation, left_type.name, right_type.name))
				Result := False
			end
		end

	check_boolean_expression (an_element: BOOLEAN_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type BOOLEAN_EXPRESSION?
		note
			rule: "[
				In an environment where `an_element' is
				a quantification,
				a call,
				an operator expression,
				or a constant,
				`an_element' is OK.
				]"
		do
			if attached {QUANTIFICATION} an_element as quantification then
				Result := check_quantification (quantification, enclosing_class, enclosing_feature)
			elseif attached {CALL} an_element as call then
				Result := check_call (call, enclosing_class, enclosing_feature)
			elseif attached {OPERATOR_EXPRESSION} an_element as operator_expression then

			elseif attached {CONSTANT} an_element as constant then

			else
				Result := False
			end
		end

	check_call (an_element: CALL; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type CALL?
		note
			rule: "[
				In an environment where the first call in the call chain is,
					in the interface of the enclosing class
					or if assertion is in a pre- or postcondition to a feature,
					an argument to that feature, and is not the enclosing feature itself.
				and the call

				]"
		local
			prev_call_type: like last_call_type
			is_first_call: BOOLEAN
		do
			if an_element.has_parenthesized_qualifier then
				prev_call_type := type_of_expression (an_element.parenthesized_qualifier, enclosing_class, enclosing_feature)
			else
				prev_call_type := enclosing_class
			end

			-- Check call chain.
			-- First call must be in interface of enclosing class
			-- or, if enclosing feature is present, an argument of that feature - but NOT the feature itself!
			from
				an_element.call_chain.start
				is_first_call := not an_element.has_parenthesized_qualifier
					-- Only if no qualifier is present is the first call in the chain _the_ first call.
			until
				an_element.call_chain.after
			loop
				-- Check unqualified call - will update last_call_type
				Result := check_unqualified_call (an_element.call_chain.item_for_iteration, prev_call_type, enclosing_feature, is_first_call) and Result

				is_first_call := False
				prev_call_type := last_call_type

				an_element.call_chain.forth
			end
		end

	check_enumerated_set (an_element: ENUMERATED_SET; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type ENUMERATED_SET?
		note
			rule: "[
				In an environment where all the elements in the `an_element' conform to the same type,
				 `an_element' is OK.
				]"
		local
			current_element: ENUMERATION_ELEMENT
			current_type: TBON_TC_CLASS_TYPE
			ref_type: TBON_TC_CLASS_TYPE
				-- All types in the set must either be an ancestor to ref_type or conform to ref_type.
		do
			if first_phase then
				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				from
					an_element.start
				until
					an_element.after
				loop
					current_element := an_element.item_for_iteration

					if attached {EXPRESSION} current_element as expression then
						-- Set ref_type if not set.
						if ref_type = Void then
							ref_type := type_of_expression (expression, enclosing_class, enclosing_feature)
						end
						current_type := type_of_expression (expression, enclosing_class, enclosing_feature)

					elseif attached {INTEGER_INTERVAL} current_element as int_interval then
						-- Set ref_type if not set.
						if attached {TBON_TC_INTEGER_TYPE} type_with_name (integer_type_name, formal_type_context) as integer_type then
							if ref_type = Void then
								ref_type := integer_type
							end
							current_type := integer_type
						else
							add_error (err_code_undefined, err_undefined ("Type INTEGER does not exist"))
							Result := False
						end

					elseif attached {CHARACTER_INTERVAL} current_element as char_interval then
						if attached {TBON_TC_CHARACTER_TYPE} type_with_name (integer_type_name, formal_type_context) as character_type then
							-- Set ref_type if not set.
							if ref_type = Void then
								ref_type := character_type
							end
							current_type := character_type
						else
							add_error (err_code_undefined, err_undefined ("Type CHARACTER does not exist"))
							Result := False
						end
					end

					if ref_type = Void or current_type = Void then
						-- Error - Void or undefined type appeared in enumerated set.
						add_error (err_code_void_type_in_set, err_void_type_in_set (enclosing_class.name))
						Result := False
					end

					if Result then
						-- Check if type of current element conforms to referenc type.
						if not current_type.conforms_to (ref_type) and not ref_type.conforms_to (current_type) then
							-- Error - types in enumerated set does not match.
							add_error (err_code_types_in_enumerated_set_do_not_match, err_types_in_enumerated_set_do_not_match (enclosing_class.name))
							Result := False
						-- If reference type conforms to current type, set current type as reference type.
						elseif ref_type.conforms_to (current_type) then
							current_type := ref_type
						end
					end

					an_element.forth
				end

				last_set_type := ref_type
			else
				Result := False
			end
		ensure
			set_type_not_void:
			(second_phase and Result) implies last_set_type /= Void
		end


	check_identifier_list (an_element: STRING_LIST; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type STRING_LIST?
		note
			rule: "[
				In an environment where all elements are unique,
				`an_element' is OK.
				]"
		local
			seen_elements: LIST[STRING]
			already_in_scope: BOOLEAN
		do
			create {ARRAYED_LIST[STRING]} seen_elements.make (10)
			seen_elements.compare_objects

			Result := True

			from
				an_element.start
			until
				an_element.after
			loop
				if seen_elements.has (an_element.item_for_iteration) then
					add_error (err_code_duplicate_identifiers, err_duplicate_identifiers (an_element.item_for_iteration, enclosing_class.name))
					Result := False
				end
				seen_elements.extend (an_element.item_for_iteration)

				already_in_scope := variable_context.there_exists (
					agent (entry: TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]; identifier: STRING): BOOLEAN
						do
							Result := entry.first ~ identifier
						end (?, an_element.item_for_iteration)
				)

				if already_in_scope then
					add_error (err_code_identifier_already_in_scope, err_identifier_already_in_scope (an_element.item_for_iteration, enclosing_class.name))
					Result := False
				end

				an_element.forth
			end
		ensure
			no_duplicates_in_context:
			(second_phase and Result) implies an_element.for_all (
				agent (id: STRING; ids: STRING_LIST): BOOLEAN
					local
						occurrences: INTEGER
					do
						from ids.start until ids.after
						loop
							if id ~ ids.item_for_iteration then
								occurrences := occurrences + 1
							end
							ids.forth
						end
						Result := occurrences = 1
					end (?, an_element)
			)
				-- For all identifiers it holds that there does not exist another variable with the same name.
		end

	check_member_range (an_element: MEMBER_RANGE; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type MEMBER_RANGE?
		note
			rule: "[
				In an environment where the identifiers of `an_element' is OK,
				and the type of the set expression of `an_element' is OK,
				and the types of the identifiers match the type of the set expression,
				`an_element' is OK.
				]"
		local
			identifier_type: TBON_TC_CLASS_TYPE
			relation: TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]
		do
			if first_phase then
				Result := True
					-- Nothing to be done for first phase

			elseif second_phase then

				Result := check_identifier_list (an_element.identifiers, enclosing_class)
				Result := Result and check_set_expression (an_element.set_expression, enclosing_class, enclosing_feature)

				if Result then

					-- Each identifier must either not be present in the variable context,
					-- or if present, it must a have a type that conforms to the type of the set.
					from
						an_element.identifiers.start
					until
						an_element.identifiers.after
					loop
						-- Get type of variable
						identifier_type := type_of_variable (an_element.identifiers.item_for_iteration)

						-- If variable is not present in context, set its type to the type of the set expression
						if identifier_type = Void then

							create relation.make (an_element.identifiers.item_for_iteration, last_set_type)
							variable_context.extend (relation)

						elseif identifier_type /= Void and then not identifier_type.conforms_to (last_set_type) then
							add_error (err_code_identifier_in_member_range_expression_does_not_match_type_of_set, err_identifier_in_member_range_expression_does_not_match_type_of_set (an_element.identifiers.item_for_iteration, identifier_type.name, last_set_type.name, enclosing_class.name))
							Result := False
						end

						an_element.identifiers.forth
					end
				end
			end
		ensure
			all_identifiers_in_context:
			(second_phase and Result) implies an_element.identifiers.for_all (
				agent (id: STRING): BOOLEAN
					do
						Result := variable_type_relation_from_name (id) /= Void and then
								  type_of_variable (id).conforms_to (last_set_type)
					end
			)
		end

	check_operator_expression (an_element: OPERATOR_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type OPERATOR_EXPRESSION?
		note
			rule: "[
				In an environment where `an_element' is either a unary or a binary expression,
				`an_element' is OK.
				]"
		do
			if attached {UNARY_EXPRESSION} an_element as unary_expression then
				Result := check_unary_expression (unary_expression, enclosing_class, enclosing_feature)
			elseif attached {BINARY_EXPRESSION} an_element as binary_expression then
				Result := check_binary_expression (binary_expression, enclosing_class, enclosing_feature)
			else
				Result := False
			end
		end

	check_quantification (an_element: QUANTIFICATION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type QUANTIFICATION?
		note
			rule: "[
				In an environment where
				then quantifier of `an_element' is either 'for_all' or 'exists',
				and the range expression of `an_element' is either a type or member range expression,
				and the restriction, if present, has boolean type,
				and the proposition has boolean type,
				`an_element' is OK.
				]"
		do
			if first_phase then
				Result := True
					--Nothing to be done for first phase.

			elseif second_phase then
				-- Check quantifier
				Result := check_quantifier (an_element.quantifier)

				-- Check range expression
				Result := check_range_expression (an_element.range_expression, enclosing_class, enclosing_feature) and Result


				-- Check restriction
				if an_element.has_restriction and then not is_boolean_expression (an_element.restriction, enclosing_class, enclosing_feature) then
					-- Error - restriction is not a boolean expression
					Result := False
				end

				-- Check proposition
				if not is_boolean_expression (an_element.proposition, enclosing_class, enclosing_feature) then
					-- Error - proposition is not a boolean expression
					Result := False
				end
			else
				Result := False
			end
		ensure
			restriction_is_boolean:
			(second_phase and Result and an_element.has_restriction) implies is_boolean_expression (an_element.restriction, enclosing_class, enclosing_feature)

			proposition_is_boolean:
			(second_phase and Result) implies is_boolean_expression (an_element.proposition, enclosing_class, enclosing_feature)
		end

	check_quantifier (an_element: QUANTIFIER): BOOLEAN
			-- Does `an_element' type check as a type QUANTIFIER?
		note
			rule: "[
				In an environment where `an_element' is either a universal quantifier ('for_all')
				or an existential quantifier ('exists'),
				`an_element' is OK.
				]"
		do
			Result := (an_element.is_for_all and an_element.string_representation ~ "for_all") xor
					  (an_element.is_exists and an_element.string_representation ~ "exists")
		ensure
			an_element.is_for_all implies an_element.string_representation ~ "for_all"
			an_element.is_exists implies an_element.string_representation ~ "exists"
			an_element.is_for_all xor an_element.is_exists
		end

	check_range_expression (an_element: VARIABLE_RANGE_LIST; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type BOOLEAN_EXPRESSION?
		note
			rule: "[
				In an environment where each element is either a member range or a type range,
				`an_element' is OK.
				]"
		do
			if first_phase then
				Result := False
					-- Nothing to do for first phase.

			elseif second_phase then

				Result := True

				from
					an_element.start
				until
					an_element.after
				loop
					if attached {MEMBER_RANGE} an_element.item_for_iteration as member_range then

						Result := check_member_range (member_range, enclosing_class, enclosing_feature) and Result

					elseif attached {TYPE_RANGE} an_element.item_for_iteration as type_range then

						Result := check_type_range (type_range, enclosing_class)

					else
						Result := False
					end

					an_element.forth
				end

			else
				Result := False
			end
		end

	check_set_expression (an_element: SET_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type SET_EXPRESSION?
		note
			rule: "[
				In an environment where `an_element' is either an enumerated set,
				a call that has an enumerable type or
				 an operator expression that has an enumrable type,
				`an_element' is OK.
				]"
		local
			is_enumerable: BOOLEAN
		do
			if attached {ENUMERATED_SET} an_element as enum_set then
				Result := check_enumerated_set (enum_set, enclosing_class, enclosing_feature)

			else
				if attached {CALL} an_element as call then
					Result := check_call (call, enclosing_class, enclosing_feature)
					last_set_type := last_call_type

					if last_set_type = Void then
						add_error (err_code_void_type_in_set, err_void_type_in_set (enclosing_class.name))
						Result := False
					end

				elseif attached {OPERATOR_EXPRESSION} an_element as operator_expression then
					last_set_type := type_of_expression (operator_expression, enclosing_class, enclosing_feature)

					if last_set_type = Void then
						add_error (err_code_void_type_in_set, err_void_type_in_set (enclosing_class.name))
						Result := False
					else
						Result := True
					end
				end

				if Result then
					-- Check that set type is enumerable
					is_enumerable := enumerable_types.exists (
						agent (enum_type, set_type: TBON_TC_CLASS_TYPE): BOOLEAN
							do
								Result := set_type.conforms_to (enum_type)
							end (?, last_set_type)
					)

					if not is_enumerable then
						-- Warning - set type is not enumerable
						add_warning (warn_code_set_type_not_enumerable, warn_set_type_not_enumerable (last_set_type.name, enclosing_class.name))
					end
				end

			end
		end

	check_type_range (an_element: TYPE_RANGE; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type TYPE_RANGE?
		note
			rule: "[
				In an environment where the identifier list is OK and the type exists in the environment,
				`an_element' is OK.
				]"
		local
			l_class_type: TBON_TC_CLASS_TYPE
			type_instance: TBON_TC_CLASS_TYPE
		do
			if first_phase then

				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := check_identifier_list (an_element.identifiers, enclosing_class)

				if Result then
					if an_element.type.is_class_type then

						if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.type.class_type.class_name, formal_type_context) as enclosing_type then
							Result := Result and check_class_type (an_element.type.class_type, enclosing_class, enclosing_type, 0, 1)

							if Result then
								from
									an_element.identifiers.start
								until
									an_element.identifiers.after
								loop
									type_instance := instantiated_type (enclosing_type, an_element.type.class_type, enclosing_class)
									variable_context.extend (create {TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]}.make (an_element.identifiers.item_for_iteration, type_instance))

									an_element.identifiers.forth
								end
							end
						else
							add_error (err_code_class_does_not_exist, err_class_does_not_exist (an_element.type.class_type.class_name))
							Result := False
						end

					elseif an_element.type.is_formal_generic_name then

						Result := Result and enclosing_class.has_generic_name (an_element.type.formal_generic_name)

						if Result then
							create l_class_type.make (an_element.type.formal_generic_name)

							from
								an_element.identifiers.start
							until
								an_element.identifiers.after
							loop
								variable_context.extend (create {TBON_TC_TUPLE[STRING, TBON_TC_CLASS_TYPE]}.make (an_element.identifiers.item_for_iteration, l_class_type))

								an_element.identifiers.forth
							end
						end

					end
				end

			else
				Result := False
			end
		ensure
			enclosing_class_has_generic_name:
			(second_phase and Result and an_element.type.is_formal_generic_name) implies
				enclosing_class.has_generic_name (an_element.type.formal_generic_name)
		end

	check_unary_expression (an_element: UNARY_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Does `an_element' type check as a type UNARY_EXPRESSION?
		note
			rule: "[
				In an environment where the type of the expression of `an_element' has
				a prefix operator defined, and that prefix operator is equal to the operator in `an_element',
				`an_element' is OK.
				]"
		local
			expression_type: TBON_TC_CLASS_TYPE
		do
			Result := True
			expression_type := type_of_expression (an_element.expression, enclosing_class, enclosing_feature)
			-- Check that expression has prefix feature that matches the string representation
			if expression_type.interface_feature_with_name (an_element.operator.string_representation, True, False) = Void then
				-- Error unary operator 'operator' is not defined for type in assertion
				Result := False
			end
		ensure
			type_has_prefix_feature:
			Result implies type_of_expression (an_element.expression, enclosing_class, enclosing_feature).interface_feature_with_name (an_element.operator.string_representation, True, False) /= Void
		end


	check_unqualified_call (an_element: UNQUALIFIED_CALL; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE; is_first_call: BOOLEAN): BOOLEAN
			-- Does `an_element' type check as a type UNQUALIFIED_CALL?
		note
			rule: "[
				In an environment where the identifier of `an_element' is a feature in the enclosing class,
				and the number of types of arguments match,
				`an_element' is OK.
				]"
		local
			called_feature: TBON_TC_FEATURE
			called_argument: TBON_TC_FEATURE_ARGUMENT
			filtered_features: MML_SET[TBON_TC_FEATURE]
			arg_no: INTEGER
		do
			if first_phase then

				Result := True
						-- Nothing to do for first phase.

			elseif second_phase then

				Result := True

				-- If enclosing feature is present, the call is in a pre- or postcondition.
				-- Thus, the arguments of the enclosing feature, but not the feature itself, must be available.
				if enclosing_feature /= Void and is_first_call then
					if not (an_element.identifier ~ enclosing_feature.name) then
						if enclosing_feature.is_infix or enclosing_feature.is_prefix then
							-- Error - use of infix or prefix feature in assertion.
							Result := False
						end

						 -- Check if call is in interface of enclosing class
						 filtered_features := enclosing_class.interface.filtered (
						 	agent (l_feature: TBON_TC_FEATURE; call_id: STRING): BOOLEAN
						 		do
						 			Result := l_feature.name ~ call_id
						 		end (?, an_element.identifier)
						 )

						 if filtered_features.count = 1 then
							called_feature := filtered_features.any_item
						 end

						 -- If call is not a feature, it must be an argument to enclosing feature.
						 if called_feature = Void then
						 	from
						 		enclosing_feature.arguments.start
						 	until
						 		enclosing_feature.arguments.after
						 	loop
						 		if enclosing_feature.arguments.item.formal_name ~ an_element.identifier then
						 			called_argument := enclosing_feature.arguments.item
						 		end

						 		enclosing_feature.arguments.forth
						 	end
						 end

					else
						-- Error - Feature calls itself in pre- or postcondition.
						Result := False
					end

				else -- The call is in an invariant
					-- Check if call is in interface of enclosing class
					filtered_features := enclosing_class.interface.filtered (
						agent (l_feature: TBON_TC_FEATURE; call_id: STRING): BOOLEAN
							do
								Result := l_feature.name ~ call_id
							end (?, an_element.identifier)
					)

					if filtered_features.count = 1 then
						called_feature := filtered_features.any_item
					else
						-- Error - call identifier does not exist or is not in scope.
						Result := False
					end
				end

				-- If call is a feature call
				if called_feature /= Void then
					if called_feature.arguments.count = an_element.actual_arguments.count then

						-- Check if expression types match argument types
						from
							arg_no := 1
							called_feature.arguments.start
							an_element.actual_arguments.start
						until
							called_feature.arguments.exhausted or
							an_element.actual_arguments.after
						loop
							if not type_of_expression (an_element.actual_arguments.at (arg_no), enclosing_class, enclosing_feature).conforms_to (called_feature.arguments.i_th (arg_no).type) then
								-- Error - Type of actual argument does not conform to type of argument										
								Result := False
							end

							called_feature.arguments.forth
							an_element.actual_arguments.forth
						end

						last_call_type := called_feature.type
					else
						-- Error - number of arguments in called feature an call in assertion do not match
						Result := False
					end
				elseif called_argument /= Void then -- Call is an argument to enclosing feature
					last_call_type := called_argument.type
				else
				 	-- Error - called identifier does not exist or is not in scope.
				 	Result := False
				end

				if last_call_type = Void then
					-- Error - assertion involves call without type
					add_error (err_code_assertion_involves_call_with_no_type, err_assertion_involves_call_with_no_type (an_element.identifier, enclosing_feature.name, enclosing_class.name))
					Result := False
				end
			else
				Result := False
			end
		ensure
			last_call_type_set:
			(second_phase and Result) implies last_call_type /= Void

			no_enclosing_feature_means_call_must_be_in_interface:
			(second_phase and Result and (enclosing_feature = Void or not is_first_call)) implies
				enclosing_class.interface.exists (
						agent (l_feature: TBON_TC_FEATURE; call_id: STRING): BOOLEAN
							do
								Result := l_feature.name ~ call_id
							end (?, an_element.identifier)
					)
		end

	is_boolean_expression (an_expression: BOOLEAN_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): BOOLEAN
			-- Is `an_element' an expression that returns a boolean value?
		do
			Result := attached {TBON_TC_BOOLEAN_TYPE} type_of_expression (an_expression, enclosing_class, enclosing_feature)
		end

	last_call_type: TBON_TC_CLASS_TYPE
			-- What is the type last seen in a call?

	last_set_type: TBON_TC_CLASS_TYPE
			-- What is the type last seen in a set?

	type_of_expression (an_expression: EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE; enclosing_feature: TBON_TC_FEATURE): TBON_TC_CLASS_TYPE
			-- What is the type of `an_expression'?
			-- [pure] - Does not change state, but might emit errors or warnings if given bad AST.
		local
			l_last_call_type, l_last_set_type: TBON_TC_CLASS_TYPE
			left_type, right_type: TBON_TC_CLASS_TYPE
			operator_feature: TBON_TC_FEATURE
		do
			-- Manifest constants
			if attached {BOOLEAN_CONSTANT} an_expression and then attached {TBON_TC_BOOLEAN_TYPE} type_with_name (boolean_type_name, formal_type_context) as boolean_type then
				Result := boolean_type
			elseif attached {INTEGER_CONSTANT} an_expression and then attached {TBON_TC_INTEGER_TYPE} type_with_name (integer_type_name, formal_type_context) as integer_type then
				Result := integer_type
			elseif attached {REAL_CONSTANT} an_expression and then attached {TBON_TC_REAL_TYPE} type_with_name (real_type_name, formal_type_context) as real_type then
				Result := real_type
			elseif attached {CHARACTER_CONSTANT} an_expression and then attached {TBON_TC_CHARACTER_TYPE} type_with_name (character_type_name, formal_type_context) as character_type then
				Result := character_type
			elseif (attached {MANIFEST_STRING} an_expression or else
				   attached {STRING} an_expression) and then
				   attached {TBON_TC_STRING_TYPE} type_with_name (string_type_name, formal_type_context) as string_type then
				Result := string_type

			-- Constant tokens
			elseif attached {RESULT_CONSTANT} an_expression then
				if enclosing_feature /= Void then
					Result := enclosing_feature.type
					if Result = Void then
						-- Error - use of Result in feature with no/Void type
						add_error (err_code_result_constant_in_void_feature, err_result_constant_in_void_feature (enclosing_feature.name, enclosing_class.name))
					end
				else
					-- Error - use of Result in class invariant
					add_error (err_code_result_constant_in_class_invariant, err_result_constant_in_class_invariant (enclosing_class.name))
				end
			elseif attached {CURRENT_CONSTANT} an_expression then
				Result := enclosing_class
			elseif attached {VOID_CONSTANT} an_expression then
				Result := Void

			-- Quantification
			elseif attached {QUANTIFICATION} an_expression and then attached {TBON_TC_BOOLEAN_TYPE} type_with_name (boolean_type_name, formal_type_context) as boolean_type then
				Result := boolean_type

			-- Call
			elseif attached {CALL} an_expression as call then
				l_last_call_type := last_call_type
				if check_call (call, enclosing_class, enclosing_feature) then
					Result := last_call_type
				end
				last_call_type := l_last_call_type

			-- Operator expressions
			elseif attached {UNARY_EXPRESSION} an_expression as unary_expression then
				left_type := type_of_expression (unary_expression, enclosing_class, enclosing_feature)
				if left_type /= Void then
					operator_feature := left_type.interface_feature_with_name (unary_expression.operator.string_representation, True, False)
					if operator_feature /= Void then
						Result := operator_feature.type
					end
				end

			elseif attached {BINARY_EXPRESSION} an_expression as binary_expression then
				left_type := type_of_expression (binary_expression, enclosing_class, enclosing_feature)
				right_type := type_of_expression (binary_expression, enclosing_class, enclosing_feature)

				if left_type /= Void then
					operator_feature := left_type.interface_feature_with_name (binary_expression.operator.string_representation, False, True)
					--  If operator exists and right hand type conforms to argument type, return feature type.
					if operator_feature /= Void and then operator_feature.arguments.count > 0 and then
						right_type /= Void and then right_type.conforms_to (operator_feature.arguments.first.type) then
						Result := operator_feature.type
					end
				end

			-- Enumerated set
			elseif attached {ENUMERATED_SET} an_expression as enum_set then
				l_last_set_type := last_set_type
				if check_enumerated_set (enum_set, enclosing_class, enclosing_feature) then
					Result := last_set_type
				end
				last_set_type := l_last_set_type

			else
				Result := Void
			end
		ensure
			last_set_type = old last_set_type
			last_call_type = old last_call_type
		end

feature -- Type checking, dynamic diagrams

	check_dynamic_block (an_element: DYNAMIC_COMPONENTS): BOOLEAN
			-- Does `an_element' type check as a type DYNAMIC_COMPONENTS?
		note
			rule: "[
				In an environment where each element of `an_element' is
				a scenario description,
				an object group, 
				an object stack,
				an object,
				or a message relation,
				`an_element' is OK.
				]"
		do
			from
				Result := True
				an_element.start
			until
				an_element.after
			loop
				if attached {SCENARIO_DESCRIPTION} an_element as scenario_desc then
					Result := Result and check_scenario_description (scenario_desc)
				elseif attached {OBJECT_GROUP} an_element as obj_group then
					Result := Result and check_object_group (obj_group)
				elseif attached {OBJECT_STACK} an_element as obj_stack then
					Result := Result and check_object_stack (obj_stack)
				elseif attached {OBJECT} an_element as obj then
					Result := Result and check_object (obj)
				elseif attached {MESSAGE_RELATION} an_element as msg_relation then
					Result := Result and check_message_relation (msg_relation)
				else
					Result := False
				end

				an_element.forth
			end
		end

	check_dynamic_diagram (an_element: DYNAMIC_DIAGRAM): BOOLEAN
			-- Does `an_element' type check as a type DYNAMIC_DIAGRAM?
		note
			rule: "[
				In an environment where the extended ID and the comment of `an_element' is OK,
				and all the dynamic components of `an_element' is OK,
				`an_element' is OK.
				]"
		do
			if first_phase then

				-- Reset dynamic context for new dynamic diagram.
				create dynamic_object_context.default_create

				-- Reset scenario context for new dynamic diagram.
				create dynamic_scenario_context.default_create

				Result := True

				if an_element.has_name then
					Result := Result and check_extended_id (an_element.name)
				end

				if an_element.has_comment then
					Result := Result and check_comment (an_element.comment)
				end

				if an_element.has_components then
					Result := Result and check_dynamic_block (an_element.components)
				end

			elseif second_phase then

				Result := True

				if an_element.has_components then
					Result := Result and check_dynamic_block (an_element.components)
				end

				-- Resolve dynamic references before leaving dynamic diagram
				Result := Result and resolve_dynamic_references

			else
				Result := False
			end
		end

	check_dynamic_reference (an_element: DYNAMIC_REF): BOOLEAN
			-- Does `an_element' type check as a type DYNAMIC_REF?
		note
			rule: "[
				In an environment where, if `an_element' has an object name, this object exists,
				and if `an_element' has a group name, this group exists,
				and the group prefix matches the dynamic group hierarchy in the current context
				]"
		local
			group_index: INTEGER
			current_group: TBON_TC_OBJECT_GROUP
		do
			if first_phase then
				Result := True
					-- Nothing to be done for first phase.

			elseif second_phase then

				Result := True

				if an_element.has_object_name then
					if attached {TBON_TC_OBJECT} dynamic_object_with_name (an_element.object_name.string_representation) as object then
						current_group := object.group
					else
						-- Error - referenced object does not exist
						add_error (err_code_object_does_not_exist, err_object_does_not_exist (an_element.object_name.string_representation))
						Result := False
					end
				elseif an_element.has_group_name then
					if attached {TBON_TC_OBJECT_GROUP} dynamic_object_with_name (an_element.group_name) as group then
						current_group := group.group
					else
						-- Error - referenced object group does not exist
						add_error (err_code_object_group_does_not_exist, err_object_group_does_not_exist (an_element.group_name))
						Result := False
					end
				else
					add_error (err_code_undefined, err_undefined ("Referenced object has no name."))
					Result := False
				end

				-- Check group prefix
				from
					group_index := an_element.group_count
				until
					group_index < 1 or current_group = Void
				loop
					if object_group_exists (an_element.group (group_index), dynamic_object_context) then
						if not (current_group.name ~ an_element.group (group_index)) then
							-- Error - group in dynamic reference does not match group for object
							if an_element.has_object_name then
								add_error (err_code_prefix_group_does_not_match_object_group, err_prefix_group_does_not_match_object_group (an_element.group (group_index), an_element.object_name.string_representation))
							elseif an_element.has_group_name then
								add_error (err_code_prefix_group_does_not_match_object_group, err_prefix_group_does_not_match_object_group (an_element.group (group_index), an_element.group_name))
							end
							Result := False
						end
					else
						-- Error - group in prefix does not exist
						if an_element.has_object_name then
							add_error (err_code_prefix_group_does_not_exist, err_prefix_group_does_not_exist (an_element.group (group_index), an_element.object_name.string_representation))
						elseif an_element.has_group_name then
							add_error (err_code_prefix_group_does_not_exist, err_prefix_group_does_not_exist (an_element.group (group_index), an_element.group_name))
						end
						Result := False
					end

					current_group := current_group.group
					group_index := group_index - 1
				end

			else
				Result := False
			end
		end

	check_labeled_action (an_element: LABELED_ACTION; enclosing_scenario: TBON_TC_SCENARIO_DESCRIPTION): BOOLEAN
			-- Does `an_element' type check as a type LABELED_ACTION?
		note
			rule: "[
				In an environment where the action label of `an_element' is unique in the context
				(no two action labels in one diagram diagram may be the same),
				`an_element' is OK.
				]"
		local
			lower, upper, i: INTEGER
			lower_is_set, upper_is_set: BOOLEAN
			unknown_format: BOOLEAN
			char_list: LINEAR[CHARACTER]
			acc: STRING
		do
			if first_phase then

				Result := True

				if not labeled_action_exists (an_element.action_label, dynamic_scenario_context) then
					-- Parse action label intervals, such as "1-3"
					-- If first and last char of action label is integer, and the string contains a -, try to parse it.
					if an_element.action_label.at (1).is_digit and an_element.action_label.at (an_element.action_label.count).is_digit and an_element.action_label.has ('-') then
						from
							char_list := an_element.action_label.linear_representation
							char_list.start
							lower_is_set := False
						 	upper_is_set := False
							unknown_format := False
							acc := ""
						until
							char_list.exhausted
						loop
							if char_list.item.is_digit then
								acc.append_character (char_list.item)
							elseif char_list.item.is_equal ('-') and acc.is_integer and not lower_is_set then
								-- Set lower bound of interval
								lower := acc.to_integer
								lower_is_set := True
								acc := ""
							else
								unknown_format := True
								char_list.finish
							end

							char_list.forth
						end

						-- Set upper bound of interval
						if not acc.is_empty and acc.is_integer and not unknown_format then
							upper := acc.to_integer
							upper_is_set := True

							-- Check interval validity
							if lower_is_set and upper_is_set and then (lower >= upper) then
								lower_is_set := False
								upper_is_set := False
							end
						end
					end

					if lower_is_set and upper_is_set then -- Add one action label per number in interval
						from
							i := lower
						until
							i >= upper
						loop
							if not labeled_action_exists (i.out, dynamic_scenario_context) then
								enclosing_scenario.add_labeled_action (create {TBON_TC_TUPLE[STRING,STRING]}.make (i.out, an_element.action_description))
							else
								-- Error - labeled action already exists in dynamic diagram
								add_error (err_code_labeled_action_already_exists_in_context, err_labeled_action_already_exists_in_context (i.out))
								Result := False
							end

							i := i + 1
						end
					else -- If action label is not an interval, treat it as a simple string
						enclosing_scenario.add_labeled_action (create {TBON_TC_TUPLE[STRING,STRING]}.make (an_element.action_label, an_element.action_description))
					end

				else
					-- Error - labeled action already exists in dynamic diagram
					add_error (err_code_labeled_action_already_exists_in_context, err_labeled_action_already_exists_in_context (an_element.action_label))
					Result := False
				end

			elseif second_phase then

				Result := True
					-- Nothing to do for second phase.

			else
				Result := False
			end
		end

	check_labeled_actions (an_element: LABELED_ACTIONS; enclosing_scenario: TBON_TC_SCENARIO_DESCRIPTION): BOOLEAN
			-- Does `an_element' type check as a type LABELED_ACTIONS?
		note
			rule: "[
				In an environment where all contained labeled actions of `an_element' is OK,
				`an_element' is OK.
				]"
		do
			Result := True
			from
				an_element.start
			until
				an_element.after
			loop
				Result := Result and check_labeled_action (an_element.item_for_iteration, enclosing_scenario)

				an_element.forth
			end
		end

	check_message_relation (an_element: MESSAGE_RELATION): BOOLEAN
			-- Does `an_element' type check as a type MESSAGE_RELATION?
		note
			rule: "[
				In an environment where the caller and the receiver dynamic references are OK,
				and the referenced meesage label, if present, is defined in a labeled action is
				the enclosing dynamic diagram,
				`an_element' is OK.
				]"
		do
			if first_phase then

				Result := True
				-- Mark dynamic references as unresolved
				unresolved_dynamic_references.extend (an_element.caller)
				unresolved_dynamic_references.extend (an_element.receiver)

			elseif second_phase then

				Result := True
				-- Check that message label exists in context
				if an_element.has_message_label then
					if not labeled_action_exists (an_element.message_label, dynamic_scenario_context) then
						add_error (err_code_message_label_in_dynamic_reference_does_not_exist, err_message_label_in_dynamic_reference_does_not_exist (an_element.message_label))
						Result := False
					end
				end

			else
				Result := False
			end
		ensure
			message_label_exists:
			(second_phase and Result and an_element.has_message_label) implies labeled_action_exists (an_element.message_label, dynamic_scenario_context)
		end

	check_object (an_element: OBJECT): BOOLEAN
			-- Does `an_element' type check as a type OBJECT?
		note
			rule: "[
				In an environment where `an_element' is unique
				(meaning that the combination of class name and extended ID is a unique object name)
				`an_element' is OK.
				]"
		local
			object: TBON_TC_OBJECT
		do
			if first_phase then

				Result := True

				if not object_name_exists (an_element.name.string_representation, dynamic_object_context) then
					-- Create object
					if an_element.name.has_extended_id then
						create object.make_object (an_element.name.class_name, an_element.name.extended_id)
					else
						create object.make_object (an_element.name.class_name, Void)
					end

					-- Add to context
					add_to_dynamic_object_context (object)

					-- Check comment
					if an_element.has_comment then
						Result := Result and check_comment (an_element.comment)
					end
				else
					-- Error - Object already exists in context
					add_error (err_code_object_already_exists, err_object_already_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				Result := True
				if not object_exists (an_element.name.string_representation, dynamic_object_context) then
					add_error (err_code_object_does_not_exist, err_object_does_not_exist (an_element.name.string_representation))
					Result := False
				end

			else
				Result := False
			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not object_exists (an_element.name.string_representation, old dynamic_object_context)

			exists_in_environment:
			(first_phase and Result) implies object_exists (an_element.name.string_representation, dynamic_object_context)
		end

	check_object_group (an_element: OBJECT_GROUP): BOOLEAN
			-- Does `an_element' type check as a type OBJECT_GROUP?
		note
			rule: "[
				In an environment where name of `an_element' is unique,
				and its the contained elements of `an_element' is OK,
				`an_element' is OK.
				]"
		local
			object_group: TBON_TC_OBJECT_GROUP
		do
			if first_phase then

				Result := True

				if not object_name_exists (an_element.group_name, dynamic_object_context) then
					-- Create object group
					create object_group.make (an_element.group_name)
					-- Add to context
					add_to_dynamic_object_context (object_group)
					-- Set status
					if an_element.is_nameless then
						object_group.set_is_nameless
					end

					if an_element.has_comment then
						Result := Result and check_comment (an_element.comment)
					end

					if an_element.has_group_components then
						Result := Result and check_dynamic_block (an_element.group_components)
					end
				else
					-- Error - object group already exists.
					add_error (err_code_object_group_already_exists, err_object_group_already_exists (an_element.group_name))
					Result := False
				end

			elseif second_phase then

				Result := True

				if attached {TBON_TC_OBJECT_GROUP} dynamic_object_with_name (an_element.group_name) as current_group then
					-- Check dynamic components
					if an_element.has_group_components then
						from
							an_element.group_components.start
						until
							an_element.group_components.after
						loop
							if attached {SCENARIO_DESCRIPTION} an_element.group_components.item_for_iteration as scenario_desc then

								Result := Result and check_scenario_description (scenario_desc)

							elseif attached {OBJECT_GROUP} an_element.group_components.item_for_iteration as obj_group then
								-- Set current group as parent group
								if attached {TBON_TC_OBJECT_GROUP} dynamic_object_with_name (obj_group.group_name) as env_obj then
									env_obj.set_group (current_group)
								end
								Result := Result and check_object_group (obj_group)

							elseif attached {OBJECT_STACK} an_element.group_components.item_for_iteration as obj_stack then
								-- Set current group as parent group
								if attached {TBON_TC_OBJECT} dynamic_object_with_name (obj_stack.name.string_representation) as env_obj then
									env_obj.set_group (current_group)
								end
								Result := Result and check_object_stack (obj_stack)

							elseif attached {OBJECT} an_element.group_components.item_for_iteration as obj then
								-- Set current group as parent group
								if attached {TBON_TC_OBJECT} dynamic_object_with_name (obj.name.string_representation) as env_obj then
									env_obj.set_group (current_group)
								end
								Result := Result and check_object (obj)

							elseif attached {MESSAGE_RELATION} an_element.group_components.item_for_iteration as msg_relation then
								Result := Result and check_message_relation (msg_relation)

							else
								Result := False
							end

							an_element.group_components.forth
						end
					end
				else
					add_error (err_code_object_group_does_not_exist, err_object_group_does_not_exist (an_element.group_name))
					Result := False
				end

			else
				Result := False
			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not object_group_exists (an_element.group_name, old dynamic_object_context)

			exists_in_environment:
			(first_phase and Result) implies object_group_exists (an_element.group_name, dynamic_object_context)
		end

	check_object_stack (an_element: OBJECT_STACK): BOOLEAN
			-- Does `an_element' type check as a type OBJECT_STACK?
		note
			rule: "[
				In an environment where `an_element' is unique
				(meaning that the combination of class name and extended ID is a unique object name)
				`an_element' is OK.
				]"
		local
			object: TBON_TC_OBJECT
		do
			if first_phase then

				Result := True

				if not object_name_exists (an_element.name.string_representation, dynamic_object_context) then
					-- Create object
					if an_element.name.has_extended_id then
						create object.make_object (an_element.name.class_name, an_element.name.extended_id)
					else
						create object.make_object (an_element.name.class_name, Void)
					end

					object.set_is_object_stack

					-- Add to context
					add_to_dynamic_object_context (object)

					-- Check comment
					if an_element.has_comment then
						Result := Result and check_comment (an_element.comment)
					end
				else
					-- Error - Object already exists in context
					add_error (err_code_object_stack_already_exists, err_object_stack_already_exists (an_element.name.string_representation))
					Result := False
				end

			elseif second_phase then

				Result := True
				if not object_stack_exists (an_element.name.string_representation, dynamic_object_context) then
					add_error (err_code_object_stack_does_not_exist, err_object_stack_does_not_exist (an_element.name.string_representation))
					Result := False
				end

			else
				Result := False
			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not object_stack_exists (an_element.name.string_representation, old dynamic_object_context)

			exists_in_environment:
			(first_phase and Result) implies object_stack_exists (an_element.name.string_representation, dynamic_object_context)
		end

	check_scenario_description (an_element: SCENARIO_DESCRIPTION): BOOLEAN
			-- Does `an_element' type check as a type SCENARIO_DESCRIPTION?
		note
			rule: "[
				In an environment where the scenario name of `an_element' is unique,
				and all its contained labeled actions are OK,
				`an_element' is OK.
				]"
		local
			scenario: TBON_TC_SCENARIO_DESCRIPTION
		do
			if first_phase then

				Result := True

				if not scenario_exists (an_element.scenario_name, dynamic_scenario_context) then
					create scenario.make (an_element.scenario_name)

					if an_element.has_comment then
						Result := Result and check_comment (an_element.comment)
					end

					Result := Result and check_labeled_actions (an_element.labeled_actions, scenario)
				else
					-- Error - scenario already exists in context
					add_error (err_code_scenario_already_exists, err_scenario_already_exists (an_element.scenario_name))
					Result := False
				end

			elseif second_phase then

				Result := True
					-- Nothing to be done for second phase.

			else
				Result := False
			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not scenario_exists (an_element.scenario_name, old dynamic_scenario_context)

			exists_in_environment:
			(first_phase and Result) implies scenario_exists (an_element.scenario_name, dynamic_scenario_context)
		end


feature -- Type checking, auxiliary - dynamic diagram

	labeled_action_exists (an_action_label: STRING; a_context: like dynamic_scenario_context): BOOLEAN
			-- Does `an_action_label' exist in the current dynamic scenario context?
		do
			Result := a_context.exists (
				agent (scenario: TBON_TC_SCENARIO_DESCRIPTION; action_label: STRING): BOOLEAN
					do
						Result := scenario.has_labeled_action (action_label)
					end
			)
		end

	object_exists (an_obj_name: STRING; a_context: like dynamic_object_context): BOOLEAN
			-- Does `an_obj_name' exist in the current dynamic object context as an object?
		do
			Result := a_context.exists (
				agent (obj: TBON_TC_DYNAMIC_OBJECT; obj_name: STRING): BOOLEAN
					do
						Result := obj.name ~ obj_name and attached {TBON_TC_OBJECT} obj
					end (?, an_obj_name)
			)
		end

	object_stack_exists (an_obj_name: STRING; a_context: like dynamic_object_context): BOOLEAN
			-- Does `an_obj_name' exist in the current dynamic object context as an object stack?
		do
			Result := a_context.exists (
				agent (obj: TBON_TC_DYNAMIC_OBJECT; obj_name: STRING): BOOLEAN
					do
						Result := obj.name ~ obj_name and attached {TBON_TC_OBJECT} obj as obj_stack and then obj_stack.is_object_stack
					end (?, an_obj_name)
			)
		end

	object_name_exists (an_obj_name: STRING; a_context: like dynamic_object_context): BOOLEAN
			-- Does `an_obj_name' exist in the current dynamic object context as an object group?
		do
			Result := a_context.exists (
				agent (obj: TBON_TC_DYNAMIC_OBJECT; obj_name: STRING): BOOLEAN
					do
						Result := obj.name ~ obj_name
					end (?, an_obj_name)
			)
		end

	object_group_exists (a_group_name: STRING; a_context: like dynamic_object_context): BOOLEAN
			-- Does `a_group_name' exist in the current dynamic object context?
		do
			Result := a_context.exists (
				agent (obj: TBON_TC_DYNAMIC_OBJECT; group_name: STRING): BOOLEAN
					do
						Result := obj.name ~ group_name and attached {TBON_TC_OBJECT_GROUP} obj
					end (?, a_group_name)
			)
		end

	dynamic_object_with_name (an_obj_name: STRING): TBON_TC_DYNAMIC_OBJECT
			-- Which object in `dynamic_object_context' has the name `an_obj_name'?
		local
			filtered_set: like dynamic_object_context
		do
			if object_name_exists (an_obj_name, dynamic_object_context) then
				filtered_set := dynamic_object_context.filtered (
					agent (obj: TBON_TC_DYNAMIC_OBJECT; obj_name: STRING): BOOLEAN
						do
							Result := obj.name ~ obj_name
						end
				)

				check filtered_set.count = 1 end
				Result := filtered_set.any_item
			else
				Result := Void
			end
		ensure
			name_exists_means_not_void: object_name_exists (an_obj_name, dynamic_object_context) implies Result /= Void
			names_are_equal: Result /= Void implies Result.name ~ an_obj_name
		end

	resolve_dynamic_references: BOOLEAN
			-- Resolve the dynamic references of `Current'. True if all references resolve.
		do
			Result := unresolved_dynamic_references.for_all (
				agent (ref: DYNAMIC_REF): BOOLEAN
					do
						Result := check_dynamic_reference (ref)
					end
			)
		end

	scenario_exists (a_scenario_name: STRING; a_context: like dynamic_scenario_context): BOOLEAN
			-- Does `a_scenario_name' exist in the current dynamic scenario context?
		do
			Result := dynamic_scenario_context.exists (
				agent (sc: TBON_TC_SCENARIO_DESCRIPTION; a_name: STRING): BOOLEAN
					do
						Result := sc.name ~ a_name
					end (?, a_scenario_name)
			)
		end

	unresolved_dynamic_references: LIST[DYNAMIC_REF]
			-- What are the unresolved dynamic references of `Current'?

feature -- dummy


	check_dummy (an_element: BOOLEAN_EXPRESSION; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type BOOLEAN_EXPRESSION?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end -- ~
		end


end
