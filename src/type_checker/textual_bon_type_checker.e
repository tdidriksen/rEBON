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
			type_context := type_context.updated (boolean_type.name.as_upper, boolean_type)
			type_context := type_context.updated (character_type.name.as_upper, character_type)
			type_context := type_context.updated (integer_type.name.as_upper, integer_type)
			type_context := type_context.updated (real_type.name.as_upper, real_type)
			type_context := type_context.updated (string_type.name.as_upper, string_type)

			create value_context.default_create
		end


feature -- Contexts
	type_context: MML_MAP[STRING, TBON_TC_TYPE]
			-- What is the current type context?

	value_context: MML_SET[MML_RELATION[STRING, TBON_TC_TYPE]]
			-- What is the current value context?

feature -- Status report
	class_exists_in_context (a_class_name: STRING): BOOLEAN
			-- Does a class identified by `a_class_name' exist in the current context?
		do
			Result := type_context.domain.has (a_class_name.as_upper) and then attached {TBON_TC_CLASS_TYPE} type_context.item (a_class_name.as_upper)
		end

	cluster_exists_in_context (a_cluster_name: STRING): BOOLEAN
			-- Does a cluster identified by `a_cluster_name' exist in the current context?
		do
			Result := type_context.domain.has (a_cluster_name.as_upper) and then attached {TBON_TC_CLUSTER_TYPE} type_context.item (a_cluster_name.as_upper)
		end

	first_phase: BOOLEAN
			-- Is the type checker in the first phase?
			-- During the first phase, the type context is built.

	second_phase: BOOLEAN
			-- Is the type checker in the second phase?
			-- During the second phase, all elements and statements are checked.

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
			error_messages.do_all (agent (msg: STRING) do io.put_string (msg) end)
		end

	print_error_messages_to_stdout
			-- Print error messages to stderr.
		do
			io.set_output_default
			error_messages.do_all (agent (msg: STRING) do io.put_string (msg) end)
		end

feature -- Type checking, informal
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
				Result := check_bon_specification (a_bon_spec)
			elseif second_phase then
				if not error_messages.is_empty then
					print_error_messages_to_stderr
					Result := False
				end
			end
		end

	check_class_chart (an_element: CLASS_CHART): BOOLEAN
			-- Does `an_element' type check as a type CLASS_CHART?
		local
			class_type: TBON_TC_CLASS_TYPE
		do
			if first_phase then

				create class_type.make (an_element.name)
				type_context := type_context.updated (class_type.name.as_upper, class_type)

			elseif second_phase then

				check false end

			else
				Result := False
			end
		end

	check_cluster_chart (an_element: CLUSTER_CHART): BOOLEAN
			-- Does `an_element' type check as a type CLUSTER_CHART?
		local
			cluster_type: TBON_TC_CLUSTER_TYPE
		do
			if first_phase then

				create cluster_type.make (an_element.name)
				type_context := type_context.updated (cluster_type.name.as_upper, cluster_type)

			elseif second_phase then

				check false end

			else
				Result := False
			end
		end

	check_comment (an_element: COMMENT): BOOLEAN
			-- Does `an_element' type check as a type COMMENT?
			-- Rule:
			-- 	In an environment where all line comments in a comment 'c' are STRINGs, 'c' is a type COMMENT.
		do
			Result := True
				-- A comment is type checked by default, as it is a list of STRING.
		end

	check_creation_chart (an_element: CREATION_CHART): BOOLEAN
			-- Does `an_element' type check as a type CREATION_CHART?
		do
			check false end
		end

	check_event_chart (an_element: EVENT_CHART): BOOLEAN
			-- Does `an_element' type check as a type EVENT_CHART?
		do
			check false end
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
		do
			check false end
		end

	check_static_diagram (an_element: STATIC_DIAGRAM): BOOLEAN
			-- Does `an_element' type check as a type STATIC_DIAGRAM?
		do
			check false end
		end

	check_system_chart (an_element: SYSTEM_CHART): BOOLEAN
			-- Does `an_element' type check as a type SYSTEM_CHART?
			-- Rule:
			-- 	In an environment where all the contained cluster charts in `an_element' is are type checked,
			--	`an_element' is type checked.
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

					if not cluster_exists_in_context (cluster.name) then
						error_messages.extend (err_cluster_does_not_exist (cluster.name))
						Result := False
					end
				end

			else
				Result := False
			end
		ensure
			all_clusters_exist: second_phase implies (not Result or (Result and an_element.clusters.for_all (agent (entry: CLUSTER_ENTRY): BOOLEAN do Result := cluster_exists_in_context (entry.name) end)))
				-- for_all entry member_of clusters such_that entry: CLUSTER_ENTRY it_holds exists cluster member_of context such_that cluster: TBON_TC_CLUSTER_TYPE it_holds cluster.name = entry.name
				-- If the type checker claims that the system chart is OK, all its clusters must exist.
		end

end
