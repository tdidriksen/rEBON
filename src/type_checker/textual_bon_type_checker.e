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
		undefine
			is_equal
		end

	TBON_TC_WARNING
		rename
			make as make_warning,
			code as warning_code,
			message as warning_message
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
			create boolean_type.make
			create character_type.make
			create integer_type.make
			create real_type.make
			create string_type.make
			-- Create ANY
			create any_type.make (any_type_name)

			-- Add default value types to context
			add_to_informal_type_context (boolean_type)
			add_to_informal_type_context (character_type)
			add_to_informal_type_context (integer_type)
			add_to_informal_type_context (real_type)
			add_to_informal_type_context (string_type)
			add_to_informal_type_context (any_type)

			add_to_formal_type_context (boolean_type)
			add_to_formal_type_context (character_type)
			add_to_formal_type_context (integer_type)
			add_to_formal_type_context (real_type)
			add_to_formal_type_context (string_type)
			add_to_formal_type_context (any_type)

			create value_context.default_create

			create {ARRAYED_LIST[STRING]} extended_ids.make (10)
			extended_ids.compare_objects
		end


feature {NONE} -- Contexts
	informal_type_context: MML_SET[TBON_TC_TYPE]
			-- What is the current informal type context?

	formal_type_context: MML_SET[TBON_TC_TYPE]
			-- What is the current formal type context?

	value_context: MML_SET[MML_RELATION[STRING, TBON_TC_TYPE]]
			-- What is the current value context?

	extended_ids: LIST[STRING]

	unresolved_features: MML_SET[TBON_TC_FEATURE]

feature -- Status report
	first_phase: BOOLEAN
			-- Is the type checker in the first phase?
			-- During the first phase, the type context is built.

	second_phase: BOOLEAN
			-- Is the type checker in the second phase?
			-- During the second phase, all elements and statements are checked.

	class_name_exists_in_context (a_class_name: STRING; a_context: MML_SET[TBON_TC_TYPE]): BOOLEAN
			-- Does `a_name' exist in `a_context' as a class type?
		do
			Result := name_exists_in_context (a_class_name, a_context) and attached {TBON_TC_CLASS_TYPE} type_with_name (a_class_name, a_context)
		end

	name_exists_in_context (a_name: STRING; a_context: MML_SET[TBON_TC_TYPE]): BOOLEAN
			-- Does `a_name' exist in `a_context'?
		require
			name_not_void: a_name /= Void
		do
			Result := a_context.exists (agent names_are_equal (?, a_name))
		end


feature {NONE} -- Auxiliary features
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

	type_with_name (a_name: STRING; a_type_context: MML_SET[TBON_TC_TYPE]): TBON_TC_TYPE
			-- What type in `type_context' has the name `a_name'?
		--require
			--name_exists: name_exists_in_context (a_name)
		local
			filtered_set: like a_type_context
		do
			if name_exists_in_context (a_name, informal_type_context) then
				filtered_set := a_type_context.filtered (agent names_are_equal (?, a_name))
				check filtered_set.count = 1 end
				Result := filtered_set.any_item
			else
				Result := Void
			end
		ensure
			--type_not_void: Result /= Void
			name_exists_means_not_void: name_exists_in_context (a_name, informal_type_context) implies Result /= Void
			names_are_equal: Result /= Void implies names_are_equal (Result, a_name)
		end

	names_are_equal (a_type: TBON_TC_TYPE; a_name: STRING): BOOLEAN
			-- Is the name of `a_type' equal to `a_name'? (Object equality)
		require
			type_not_void: a_type /= Void
			name_not_void: a_name /= Void
		do
			Result := a_type.name ~ a_name
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
			i: INTEGER
			iteration_set: like unresolved_features
			current_feature: TBON_TC_FEATURE
			current_argument: TBON_TC_FEATURE_ARGUMENT
		do
			from
				iteration_set := unresolved_features
				i := 1
			until
				i >= unresolved_features.count
			loop
				current_feature := iteration_set.any_item
				if not class_name_exists_in_context (current_feature.type.name, formal_type_context) then
				 	add_error (err_code_feature_type_does_not_exist, err_feature_type_does_not_exist (current_feature.name, current_feature.type.name))
				end

				from
					current_feature.arguments.start
				until
					current_feature.arguments.after
				loop
					current_argument := current_feature.arguments.item_for_iteration
					if not class_name_exists_in_context (current_argument.type.name, formal_type_context) then
						add_error (err_code_feature_argument_type_does_not_exist, err_feature_argument_type_does_not_exist (current_feature.name, current_argument.formal_name, current_argument.type.name))
					end

					current_feature.arguments.forth
				end
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
		do
			Result := True
			elements := a_bon_spec.elements

			from elements.start	until elements.after loop
				element := elements.item_for_iteration

				io.put_string ("Checking!")

				if attached {COMMENT} element as comment then
					Result := Result and check_comment (comment)
				elseif attached {INFORMAL_CHART} element as chart then
					Result := Result and check_informal_chart (chart)
				elseif attached {STATIC_DIAGRAM} element as diagram then
					Result := Result and check_static_diagram (diagram)
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

				Result := Result and check_bon_specification (a_bon_spec)
			elseif second_phase then
				Result := Result and check_structure
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
						Result := not (a_descendant |=| an_ancestor)
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

	check_structure: BOOLEAN
			-- Is the structure of the abstract syntax OK?
		local
			i: INTEGER
			types: like informal_type_context
			type: TBON_TC_TYPE
		do
			Result := True
			types := informal_type_context.twin

			from
				i := 1
		 	until
		 		i >= informal_type_context.count
			loop
				type := types.any_item

				if attached {TBON_TC_CLASS_TYPE} type as class_type then
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
				i := i + 1
			end
		end

	resolve_features (a_class_type: TBON_TC_CLASS_TYPE)
			-- Resolve unresolved features that specifies `a_class_type' as type or argument type.
		local
			resolving_set: like unresolved_features
			iteration_set: like unresolved_features
			l_feature: TBON_TC_FEATURE
			i: INTEGER
		do
			resolving_set := unresolved_features.filtered (
				agent (l_l_feature: TBON_TC_FEATURE; l_class: TBON_TC_CLASS_TYPE): BOOLEAN
					do
						Result := l_l_feature.type.name ~ l_class.name or (not l_l_feature.arguments.for_all (
																			agent (argument: TBON_TC_FEATURE_ARGUMENT; l_l_class: TBON_TC_CLASS_TYPE): BOOLEAN
																				do
																					Result := not (argument.type.name ~ l_l_class.name)
																				end (?, l_class)
																		))
					end (?, a_class_type)
				)

			from
				iteration_set := resolving_set
				i := 1
			until
				i >= resolving_set.count
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
				if class_name_exists_in_context (l_feature.type.name, formal_type_context) and
					l_feature.arguments.for_all (agent (argument: TBON_TC_FEATURE_ARGUMENT): BOOLEAN do Result := class_name_exists_in_context (argument.type.name, formal_type_context) end)
				then
					unresolved_features := unresolved_features / l_feature
				end

				i := i + 1
				iteration_set := iteration_set / l_feature
			end
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
		--require
		--	second_phase implies name_exists_in_context (an_element.name, informal_type_context)
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
						Result := class_name_exists_in_context (name, informal_type_context)
					end
			)
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
								add_error (err_code_class_already_in_cluster, err_class_already_in_cluster (current_cluster.name))
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
								add_error (err_code_cluster_already_in_cluster, err_cluster_already_in_cluster (current_cluster.name))
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
						Result := name_exists_in_context (a_cluster.name, informal_type_context) and attached {TBON_TC_CLUSTER_TYPE} type_with_name (a_cluster.name, informal_type_context)
					end
			)

			contained_classes_exist: (second_phase and Result and an_element.has_classes) implies an_element.classes.for_all (
				agent (a_class: CLASS_ENTRY): BOOLEAN
					do
						Result := class_name_exists_in_context (a_class.name, informal_type_context)
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
					if not class_name_exists_in_context (current_entry.creator, informal_type_context) then
						add_error (err_code_creator_does_not_exist, err_creator_does_not_exist (an_element.name, current_entry.creator))
						Result := False
					end

					-- Check that all created classes exist
					from current_entry.targets.start until current_entry.targets.after
					loop
						current_target := current_entry.targets.item_for_iteration
						if not class_name_exists_in_context (current_target, informal_type_context) then
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
						Result := class_name_exists_in_context (entry.creator, informal_type_context)
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
							Result := Result and class_name_exists_in_context (target, informal_type_context)
							entry.targets.forth
						end
					end
			)
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
						if not (class_name_exists_in_context (current_entry.classes_involved.item_for_iteration, informal_type_context))
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
								Result := Result and class_name_exists_in_context (entry.classes_involved.item_for_iteration, informal_type_context)
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
				and all contracts are OK,
				and `enclosing_class' does not inherit from itselt,
				`an_element' is OK.
				]"
		local
			ancestors: CLASS_TYPE_LIST
		do
			if first_phase then



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
							add_error (err_code_class_does_not_exist, err_class_does_not_exist (ancestors.item_for_iteration.class_name))
							Result := False
						end

						ancestors.forth
					end
				end

--				Idea:
--				Put all features with unresolved types in a set.
--				Every time a new type is added to the context,
--				give corresponding features a pointer to that type.
--				If the feature set is not empty after first phase,
--				an error has occurred, as a feature is mentioning
--				a non-existing type.

			else
				Result := False
			end

		ensure
			ancestors_exist:
			(second_phase and Result and an_element.parent_count > 0) implies
				an_element.parents.for_all (
					agent (parent: CLASS_TYPE): BOOLEAN
						do
							Result := class_name_exists_in_context (parent.class_name, formal_type_context)
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
			ancestors: CLASS_TYPE_LIST
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name, formal_type_context) then
					create class_type.make (an_element.name)
					add_to_formal_type_context (class_type)
					-- Resolve features for new type.
					resolve_features (class_type)

					if an_element.is_deferred then
						class_type.set_is_deferred
					elseif an_element.is_effective then
						class_type.set_is_effective
					elseif an_element.is_root then
						class_type.set_is_root
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

					Result := check_formal_generics (an_element.generics, class_type) and Result
					Result := check_class_interface (an_element.class_interface, class_type) and Result

				else
					add_error (err_code_class_exists, err_class_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				-- Add ancestors
--				if an_element. then
--					ancestors an_element.class_interface.parents
--					from an_element.class_interface.parents.start until

--					loop

--					end
--				end

				-- If a class is declared effective, one of its parents must be deferred
				if an_element.is_effective then

				end

			end
		ensure
			not_in_old_environment:
			(first_phase and Result) implies not (name_exists_in_context (an_element.name, old formal_type_context))

			exists_in_environment:
			(first_phase and Result) implies name_exists_in_context (an_element.name, formal_type_context)

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

			formal_generic_names_exist:
				(second_phase and Result and an_element.has_generics) implies
				an_element.generics.for_all (
					agent (generic: FORMAL_GENERIC; class_spec: CLASS_SPECIFICATION): BOOLEAN
						do
							if attached {TBON_TC_CLASS_TYPE} type_with_name (class_spec.name, formal_type_context) as type then
								Result := type.generics.exists (agent (l_generic: FORMAL_GENERIC; tc_generic: TBON_TC_GENERIC): BOOLEAN
																	do
																		Result := tc_generic.formal_generic_name ~ l_generic.name
																	end (generic, ?)
																)
							else
								Result := False
							end
						end (?, an_element)
				)
					-- for_all generics in class specification exists generic name in corresponding TBON_TC_CLASS_TYPE

		end

	check_client_relation (an_element: CLIENT_RELATION): BOOLEAN
			-- Does `an_element' type check as a type CLIENT_RELATION?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end
		end

	check_cluster_specification (an_element: CLUSTER_SPECIFICATION): BOOLEAN
			-- Does `an_element' type check as a type CLUSTER_SPECIFICATION?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end
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
		end

	check_feature_arguments(an_element: FEATURE_ARGUMENT_LIST; enclosing_feature: TBON_TC_FEATURE; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
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
		do
			Result := True
			if first_phase then
				from an_element.start until an_element.after loop
					argument := an_element.item_for_iteration
					if argument.type.is_class_type then
						if attached {TBON_TC_CLASS_TYPE} type_with_name(argument.type.class_type.class_name, formal_type_context) as type then
							from argument.identifiers.start until argument.identifiers.after
							loop
								create l_argument.make (argument.identifiers.item_for_iteration, type)
								enclosing_feature.arguments.extend (l_argument)
							end
						else
							from argument.identifiers.start until argument.identifiers.after
							loop
								create t_type.make (argument.identifiers.item_for_iteration)
								create l_argument.make (argument.identifiers.item_for_iteration, t_type)
								enclosing_feature.arguments.extend (l_argument)
							end
							unresolved_features := unresolved_features.extended (enclosing_feature)
						end
					elseif argument.type.is_formal_generic_name then
						Result := enclosing_class.has_generic_name (argument.type.formal_generic_name)
						if not Result then
							
						end
					end
				end
			elseif second_phase then

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
		do
			if first_phase then

				Result := True

				from an_element.feature_specifications.start until an_element.feature_specifications.after
				loop
					Result := check_feature_specification (an_element.feature_specifications.item_for_iteration, an_element.selective_export, enclosing_class) and Result

					an_element.feature_specifications.forth
				end

			elseif second_phase then

				Result := True

				from an_element.feature_specifications.start until an_element.feature_specifications.after
				loop
					Result := check_feature_specification (an_element.feature_specifications.item_for_iteration, an_element.selective_export, enclosing_class) and Result

					an_element.feature_specifications.forth
				end

				Result := check_selective_export (an_element.selective_export, enclosing_class)

			end
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
				`an_element' is OK.
				]"
		local
			l_feature: TBON_TC_FEATURE
			l_class_type: TBON_TC_CLASS_TYPE
			current_feature_name: FEATURE_NAME
		do
			if first_phase then

				Result := True
				-- Add types to features
				-- If type does not exist, add to unresolved types
				from an_element.feature_names.start	until an_element.feature_names.after
				loop
					current_feature_name := an_element.feature_names.item_for_iteration
					if an_element.has_type and then an_element.type.is_class_type then

						if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.type.class_type.class_name, formal_type_context) as class_type then
							-- Create feature
							create l_feature.make (current_feature_name.feature_name, class_type, enclosing_class)

							-- Add feature to enclosing class
							enclosing_class.add_feature (l_feature)

						else -- The type of the feature is not known yet
							-- Create placeholder type
							create l_class_type.make (an_element.type.class_type.class_name)

							-- Create new feature with placeholder type
							create l_feature.make (current_feature_name.feature_name, l_class_type, enclosing_class)

							-- Add feature to enclosing class
							enclosing_class.add_feature (l_feature)
							-- Add feature to unresolved features
							unresolved_features := unresolved_features & l_feature
						end

					elseif an_element.has_type and then an_element.type.is_formal_generic_name then
						-- If enclosing class has generics
						if enclosing_class.generics /= Void then
							-- and the formal generics name exists in enclosing class.
							if not enclosing_class.has_generic_name (an_element.type.formal_generic_name) then
								add_error (err_code_formal_generic_name_does_not_exist, err_formal_generic_name_does_not_exist (current_feature_name.feature_name, an_element.type.formal_generic_name, enclosing_class.name))
								Result := False
							end
						else
							add_error (err_code_enclosing_class_not_generic, err_enclosing_class_not_generic (current_feature_name.feature_name, an_element.type.formal_generic_name, enclosing_class.name))
							Result := False
						end
					end

					an_element.feature_names.forth
				end

				-- Check feature arguments
				--Result := check_feature_arguments (an_element.arguments, l_feature, enclosing_class)

			elseif second_phase then

				--Result := check_feature_names (an_element.feature_names, enclosing_class)

				--Result :=

			else
				Result := False
			end
		end

	check_formal_generics (an_element: FORMAL_GENERIC_LIST; enclosing_class: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Does `an_element' type check as a type FORMAL_GENERIC_LIST?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end
		ensure
		end

	check_inheritance_relation (an_element: INHERITANCE_RELATION): BOOLEAN
			-- Does `an_element' type check as a type INHERITANCE_RELATION?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end
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

				from an_element.start until an_element.after
				loop
					if not class_name_exists_in_context (an_element.item_for_iteration, formal_type_context) and
							not (an_element.item_for_iteration ~ none_type_name) then
						add_error (err_code_selective_export_class_does_not_exist, err_selective_export_class_does_not_exist (an_element.item_for_iteration, enclosing_class.name))
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
						Result := class_name_exists_in_context (export_class_name, formal_type_context) xor
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

			elseif second_phase then

				Result := True

				if an_element.components_count > 0 then
					Result := check_static_block (an_element.components)
				end

			else
				Result := False
			end
		ensure
			(first_phase and Result and an_element.has_comment) implies check_comment (an_element.comment)
			(first_phase and Result and an_element.has_name) implies check_extended_id (an_element.name)
		end

	check_static_relation (an_element: STATIC_RELATION): BOOLEAN
			-- Does `an_element' type check as a type STATIC_RELATION?
		note
			rule: "[
				In an environment where...
				]"
		do
			check false end
		end


end
