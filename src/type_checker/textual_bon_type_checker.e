note
	description: "A type checker for textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEXTUAL_BON_TYPE_CHECKER

inherit
	TBON_TC_TEXT_ITEMS

create
	make

feature -- Initialization
	make
			-- Create a textual BON type checker.
		do
			initialize_contexts
			create {LINKED_LIST[STRING]} error_messages.make
			create {LINKED_LIST[STRING]} warnings.make
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
		do
			-- Create type context
			create type_context.default_create

			-- Create default value types
			create boolean_type.make
			create character_type.make
			create integer_type.make
			create real_type.make
			create string_type.make

			-- Add default value types to context
			add_to_type_context (boolean_type)
			add_to_type_context (character_type)
			add_to_type_context (integer_type)
			add_to_type_context (real_type)
			add_to_type_context (string_type)

			create value_context.default_create
		end


feature {NONE} -- Contexts
	type_context: MML_SET[TBON_TC_TYPE]
			-- What is the current type context?

	value_context: MML_SET[MML_RELATION[STRING, TBON_TC_TYPE]]
			-- What is the current value context?

feature -- Status report
	first_phase: BOOLEAN
			-- Is the type checker in the first phase?
			-- During the first phase, the type context is built.

	second_phase: BOOLEAN
			-- Is the type checker in the second phase?
			-- During the second phase, all elements and statements are checked.

	class_name_exists_in_context (a_class_name: STRING; a_context: like type_context): BOOLEAN
			-- Does `a_name' exist in `a_context' as a class type?
		do
			Result := name_exists_in_context (a_class_name) and attached {TBON_TC_CLASS_TYPE} type_with_name (a_class_name)
		end

	name_exists_in_context (a_name: STRING): BOOLEAN
			-- Does `a_name' exist in `type_context'?
		require
			name_not_void: a_name /= Void
		do
			Result := type_context.exists (agent names_are_equal (?, a_name))
		end


feature {NONE} -- Auxiliary features
	add_to_type_context (a_type: TBON_TC_TYPE)
			-- Add `a_type' to `type_context'.
		require
			type_not_void: a_type /= Void
		do
			type_context := type_context & a_type
		end

	type_with_name (a_name: STRING): TBON_TC_TYPE
			-- What type in `type_context' has the name `a_name'?
		--require
			--name_exists: name_exists_in_context (a_name)
		local
			filtered_set: like type_context
		do
			if name_exists_in_context (a_name) then
				filtered_set := type_context.filtered (agent names_are_equal (?, a_name))
				check filtered_set.count = 1 end
				Result := filtered_set.any_item
			else
				Result := Void
			end
		ensure
			--type_not_void: Result /= Void
			name_exists_means_not_void: name_exists_in_context (a_name) implies Result /= Void
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
	error_messages: LIST[STRING]
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
			error_messages.do_all (agent (msg: STRING) do io.put_string (msg); io.put_string ("%N") end)
		end

	print_error_messages_to_stdout
			-- Print error messages to stderr.
		do
			io.set_output_default
			io.put_string ("%NErrors:%N")
			error_messages.do_all (agent (msg: STRING) do io.put_string (msg); io.put_string ("%N") end)
		end

	warnings: LIST[STRING]
			-- What warnings have been emitted from this type checker?

	print_warnings_to_stderr
			-- Print warnings to stderr.
		do
			io.set_error_default
			io.put_string ("%NWarnings:%N")
			warnings.do_all (agent (msg: STRING) do io.put_string (msg); io.put_string ("%N") end)
		end

	print_warnings_to_stdout
			-- Print warnings to stderr.
		do
			io.set_output_default
			io.put_string ("%NWarnings:%N")
			warnings.do_all (agent (msg: STRING) do io.put_string (msg); io.put_string ("%N") end)
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
				Result := Result and check_bon_specification (a_bon_spec)
			elseif second_phase then
				Result := Result and check_structure
				if not error_messages.is_empty then
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
				error_messages.extend (err_class_inherits_from_itself (a_main_class.name, an_ancestor_class.name))
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
			types: like type_context
			type: TBON_TC_TYPE
		do
			Result := True
			types := type_context.twin

			from
				i := 1
		 	until
		 		i >= type_context.count
			loop
				type := types.any_item

				if attached {TBON_TC_CLASS_TYPE} type as class_type then
					-- Check that class is in a cluster
					if class_type.cluster = Void then
						error_messages.extend (err_class_not_in_cluster (class_type.name))
						Result := False
					end

					-- Check that class does not inherit from itself
					Result := check_ancestors (class_type, class_type) and Result
				elseif attached {TBON_TC_CLUSTER_TYPE} type as cluster_type then
					if cluster_type.parent = Void and not cluster_type.is_in_system_chart then
						error_messages.extend (err_cluster_not_in_cluster_or_system (cluster_type.name))
						Result := False
					elseif cluster_type.parent /= Void and cluster_type.is_in_system_chart then
						error_messages.extend (err_cluster_in_both_cluster_and_system (cluster_type.name))
						Result := False
					end
				end

				types := types / type
				i := i + 1
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
		require
			second_phase implies name_exists_in_context (an_element.name)
		local
			class_type, current_class: TBON_TC_CLASS_TYPE
			parents: CLASS_NAME_LIST
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name) then
					create class_type.make (an_element.name.as_upper)
					add_to_type_context (class_type)
				else
					error_messages.extend (err_class_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				Result := True

				if attached {TBON_TC_CLASS_TYPE} type_with_name (an_element.name) as a_class then
					current_class := a_class
				else
					error_messages.extend (err_class_does_not_exist (an_element.name))
					Result := False
				end

				if an_element.has_parents then
					parents := an_element.parents

					from parents.start until parents.after
					loop
						if attached {TBON_TC_CLASS_TYPE} type_with_name (parents.item_for_iteration.string) as ancestor then
							current_class.add_ancestor (ancestor)
						else
							error_messages.extend (err_ancestor_does_not_exist (current_class.name, parents.item_for_iteration.string))
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
				(first_phase and Result) implies not (old type_context.exists (
					agent (a_type: TBON_TC_TYPE; a_class: CLASS_CHART): BOOLEAN
						do
							Result := a_type.name ~ a_class.name
						end (?, an_element))
					)

			class_name_exists: first_phase implies name_exists_in_context (an_element.name)

			-- Second phase
			ancestors_exist:
			(second_phase and Result and an_element.has_parents) implies an_element.parents.for_all (
				agent (name: STRING): BOOLEAN
					do
						Result := name_exists_in_context (name) and attached {TBON_TC_CLASS_TYPE} type_with_name (name)
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
		require
			name_exists: second_phase implies name_exists_in_context (an_element.name)
		local
			cluster_type: TBON_TC_CLUSTER_TYPE
			current_cluster: TBON_TC_CLUSTER_TYPE

			class_entries: CLASS_ENTRIES
			cluster_entries: CLUSTER_ENTRIES
		do
			if first_phase then

				Result := True

				if not name_exists_in_context (an_element.name) then
					create cluster_type.make (an_element.name.as_upper)
					add_to_type_context (cluster_type)
				else
					error_messages.extend (err_cluster_exists (an_element.name))
					Result := False
				end

			elseif second_phase then

				if attached {TBON_TC_CLUSTER_TYPE} type_with_name (an_element.name) as cluster then
					current_cluster := cluster
				end

				Result := True


				if an_element.has_classes then
					class_entries := an_element.classes

					from class_entries.start until class_entries.after
					loop
						-- Check if class exists in context
						if attached {TBON_TC_CLASS_TYPE} type_with_name (class_entries.item_for_iteration.name) as class_type then
							-- Add class to cluster types
							current_cluster.add_type (class_type)
							-- Check that no class is in more than one cluster
							-- If cluster is not Void, then the class is already in a cluster, and hence is in more than one cluster.
							if class_type.cluster = Void then
								class_type.set_cluster (current_cluster)
							else
								error_messages.extend (err_class_already_in_cluster (current_cluster.name))
								Result := False
							end

						else
							error_messages.extend (err_class_does_not_exist (class_entries.item_for_iteration.name))
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
						if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster_entries.item_for_iteration.name) as cluster then
							-- Add cluster to cluster types
							current_cluster.add_type (cluster)
							-- Check that no cluster is in more than one cluster
							-- If parent is not Void, then the cluster is already in a cluster, and hence is in more than one cluster.
							if cluster.parent = Void then
								cluster.set_parent (current_cluster)
							else
								error_messages.extend (err_cluster_already_in_cluster (current_cluster.name))
								Result := False
							end

							-- Check that current cluster does not have itself as a subcluster.
							if cluster.name ~ current_cluster.name then
								error_messages.extend (err_cluster_contains_itself (current_cluster.name))
								Result := False
							end
						else
							error_messages.extend (err_cluster_does_not_exist (cluster_entries.item_for_iteration.name))
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
				(first_phase and Result) implies not (old type_context.exists (
					agent (a_type: TBON_TC_TYPE; a_cluster: CLUSTER_CHART): BOOLEAN
						do
							Result := a_type.name ~ a_cluster.name
						end (?, an_element))
					)

			name_exists: first_phase implies name_exists_in_context (an_element.name)
				-- This will always hold, no matter the errors.

			-- Second phase
			subclusters_exist: (second_phase and Result and an_element.has_clusters) implies an_element.clusters.for_all (
				agent (a_cluster: CLUSTER_ENTRY): BOOLEAN
					do
						Result := name_exists_in_context (a_cluster.name) and attached {TBON_TC_CLUSTER_TYPE} type_with_name (a_cluster.name)
					end
			)

			contained_classes_exist: (second_phase and Result and an_element.has_classes) implies an_element.classes.for_all (
				agent (a_class: CLASS_ENTRY): BOOLEAN
					do
						Result := name_exists_in_context (a_class.name) and attached {TBON_TC_CLASS_TYPE} type_with_name (a_class.name)
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
					if not class_name_exists_in_context (current_entry.creator, type_context) then
						error_messages.extend (err_creator_does_not_exist (an_element.name, current_entry.creator))
						Result := False
					end

					-- Check that all created classes exist
					from current_entry.targets.start until current_entry.targets.after
					loop
						current_target := current_entry.targets.item_for_iteration
						if not class_name_exists_in_context (current_target, type_context) then
							error_messages.extend (err_target_does_not_exist (an_element.name, current_target))
							Result := False
						end

						current_entry.targets.forth
					end


					-- Check for duplicate entries - emit warning if found
					if seen_entries.has (current_entry) then
						warnings.extend (warn_duplicate_creation_entry (an_element.name, current_entry.creator))
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
						Result := class_name_exists_in_context (entry.creator, type_context)
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
							Result := Result and class_name_exists_in_context (target, type_context)
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
						if not (class_name_exists_in_context (current_entry.classes_involved.item_for_iteration, type_context))
						then
							error_messages.extend (err_involved_class_does_not_exist (an_element.name, current_entry.name, current_entry.classes_involved.item_for_iteration))
							Result := False
						end

						current_entry.classes_involved.forth
					end

					-- Check for duplicate event names - emit warnings if found.
					if seen_entries.has (current_entry.name) then
						warnings.extend (warn_duplicate_event_entry (an_element.name, current_entry.name))
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
								Result := Result and class_name_exists_in_context (entry.classes_involved.item_for_iteration, type_context)
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
									warnings.extend (warn_duplicate_scenario_entry (chart.name, entry.name))
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

					if not name_exists_in_context (cluster.name) then
						error_messages.extend (err_cluster_does_not_exist (cluster.name))
						Result := False
					else
						if attached {TBON_TC_CLUSTER_TYPE} type_with_name (cluster.name) as cluster_type then
							if cluster_type.is_in_system_chart then
								error_messages.extend (err_cluster_already_in_system_chart (cluster_type.name))
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
			all_clusters_exist: (second_phase and Result) implies an_element.clusters.for_all (agent (entry: CLUSTER_ENTRY): BOOLEAN do Result := name_exists_in_context (entry.name) end)
				-- for_all entry member_of clusters such_that entry: CLUSTER_ENTRY it_holds exists cluster member_of context such_that cluster: TBON_TC_CLUSTER_TYPE it_holds cluster.name = entry.name
				-- If the type checker claims that the system chart is OK, all its clusters must exist.
		end

feature -- Type checking, static diagrams

	check_static_diagram (an_element: STATIC_DIAGRAM): BOOLEAN
			-- Does `an_element' type check as a type STATIC_DIAGRAM?
		do
			check false end
		end


end
