note
	description: "Text items for a textual BON type checker."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TEXT_ITEMS

feature -- Type names
	any_type_name: STRING = "ANY"
			-- Type name for an ANY type.

	array_type_name: STRING = "ARRAY"

	boolean_type_name: STRING = "BOOLEAN"
			-- Type name for a BOOLEAN type.

	character_type_name: STRING = "CHARACTER"
			-- Type name for a CHARACTER type.

	container_type_name: STRING = "CONTAINER"
			-- Type name for a CONTAINER type.

	enumerable_type_name: STRING = "ENUMERABLE"
			-- Type name for an ENUMERABLE type.

	integer_type_name: STRING = "INTEGER"
			-- Type name for an INTEGER type.

	list_type_name: STRING = "LIST"
			-- Type name for a LIST type.

	none_type_name: STRING = "NONE"
			-- Type name for a NONE type.

	real_type_name: STRING = "REAL"
			-- Type name for a REAL type.

	set_type_name: STRING = "SET"
			-- Type name for a SET.

	string_type_name: STRING = "STRING"
			-- Type name for a STRING type.

	table_type_name: STRING = "TABLE"
			-- Type name for a TABLE type.

	tuple_type_name: STRING = "TUPLE"
			-- Type name for a TUPLE type.

feature -- Error messages
	err_actual_type_does_not_match_bounding_type (a_generic_name, an_actual_type, a_class_name: STRING): STRING
		do
			Result := "Type "
			Result.append_string (an_actual_type.string)
			Result.append_string (" does not conform to bounding type of type parameter ")
			Result.append_string (a_generic_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_ancestor_does_not_exist (a_descendant_name, an_ancestor_name: STRING): STRING
		do
			Result := "Specified ancestor "
			Result.append_string (an_ancestor_name.string)
			Result.append_string (" of class ")
			Result.append_string (a_descendant_name.string)
			Result.append_string (" does not exist.")
		end

	err_argument_has_same_name_as_feature (an_argument_name, a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Argument "
			Result.append_string (an_argument_name.string)
			Result.append_string (" of feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" has same name as feature.")
		end

	err_argument_type_does_not_exist(an_argument_name, a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Type of argument "
			Result.append_string (an_argument_name.string)
			Result.append_string (" in feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" could not be found.")
		end

	err_argument_types_do_not_match_precursor (a_feature_name, a_precursor_feature_name, a_class_name: STRING): STRING
		do
			Result := "Types of arguments in redefined feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" does not match those of its precursor ")
			Result.append_string (a_precursor_feature_name.string)
			Result.append_string (".")
		end

	err_assertion_involves_call_with_no_type (a_call_name, an_enclosing_feature_name, an_enclosing_class_name: STRING): STRING
		do
			Result := "Assertion "
			if an_enclosing_feature_name /= Void then
				Result.append_string (" in feature ")
				Result.append_string (an_enclosing_feature_name.string)
			end
			Result.append_string (" in class ")
			Result.append_string (an_enclosing_class_name.string)
			Result.append_string (" involves a call to feature ")
			Result.append_string (a_call_name.string)
			Result.append_string (", but feature does not have a type.")
		end

	err_class_already_in_cluster (a_cluster_name, a_class_name, a_class_parent_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_cluster_name.string)
			Result.append_string (": class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is already in cluster ")
			Result.append_string (a_class_parent_name.string)
			Result.append_string (".")
		end

	err_class_does_not_exist (a_name: STRING): STRING
			-- Error message for when a class does not exist.
		do
			Result := "Class "
			Result.append_string (a_name.string)
			Result.append_string (" was specified, but never defined.")
		end

	err_class_does_not_inherit_from_class (a_child_name, a_parent_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_child_name.string)
			Result.append_string (" does not inherit from ")
			Result.append_string (a_parent_name.string)
			Result.append_string (" in its specification.")
		end

	err_class_exists (a_name: STRING): STRING
			-- Error message for when a class is defined more than once.
		do
			Result := "Error defining class "
			Result.append_string (a_name.string)
			Result.append_string (": name already exists. Please check that all your elements have distinct names.")
		end

	err_class_inherits_from_itself (a_descendant_name, an_ancestor_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_descendant_name.string)
			Result.append_string (" inherits from itself via class ")
			Result.append_string (an_ancestor_name.string)
		end

	err_class_not_in_cluster (a_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_name.string)
			Result.append_string (" is not in a cluster.")
		end

	err_class_not_in_specified_cluster (a_class_name, a_cluster_name: STRING): STRING
		do
			Result := "Class dictionary specifies "
			Result.append_string (a_class_name.string)
			Result.append_string (" to belong to cluster ")
			Result.append_string (a_cluster_name)
			Result.append_string (", but this relationship is never defined.")
		end

	err_cluster_already_in_cluster (a_cluster_name, a_subcluster_name, a_subcluster_parent_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_cluster_name.string)
			Result.append_string (": subcluster ")
			Result.append_string (a_subcluster_name.string)
			Result.append_string ("is already specified in cluster ")
			Result.append_string (a_subcluster_parent_name.string)
			Result.append_string (".")
		end

	err_cluster_already_in_system_chart (a_name: STRING): STRING
		do
			Result := "Error specifying cluster "
			Result.append_string (a_name.string)
			Result.append_string (": cluster is already in a system chart.")
		end

	err_cluster_does_not_exist (a_name: STRING): STRING
			-- Error message for when a cluster does not exist.
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" was specified, but never defined.")
		end

	err_cluster_exists (a_name: STRING): STRING
			-- Error message for when a cluster already exists
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": name already exists. Please check that all your elements have distinct names.")
		end

	err_cluster_contains_itself (a_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": cluster is a subcluster of itself.")
		end

	err_cluster_in_both_cluster_and_system (a_name: STRING): STRING
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" is both in a system chart and is a subcluster of a cluster.")
		end

	err_cluster_not_in_cluster_or_system (a_name: STRING): STRING
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" is not in a system chart and is not a subcluster of any cluster.")
		end

	err_creator_does_not_exist (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Specified creator class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (" does not exist.")
		end

	err_duplicate_argument_name (an_argument_name, a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Argument name "
			Result.append_string (an_argument_name.string)
			Result.append_string (" in feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name)
			Result.append_string (" is specified more than once.")
		end

	err_duplicate_feature_name (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature name "
			Result.append_string (a_feature_name.string)
			Result.append_string (" is specified more than once in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_duplicate_feature_name_inherited (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature name "
			Result.append_string (a_feature_name.string)
			Result.append_string (" is specified more than once in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" due to inheritance.")
		end

	err_duplicate_identifiers (an_identifier_name, a_class_name: STRING): STRING
		do
			Result := "Identifier "
			Result.append_string (an_identifier_name.string)
			Result.append_string (" is defined more than once in assertion in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_duplicate_inherited_feature_name (a_feature_name: STRING; a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" appears in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" more than once due to inheritance of feature with the same name.")
		end

	err_effective_feature_has_non_deferred_precursor (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is marked as effective, but has non-deferred precursor. Feature should be marked as redefined.")
		end

	err_enclosing_class_not_generic (a_feature_name, a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" specifies a generic name ")
			Result.append_string (a_generic_name.string)
			Result.append_string (", but class is not generic.")
		end

	err_feature_introduces_aggregation_with_enclosing_class (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name)
			Result.append_string (" introduces aggregation with enclosing class.")
		end

	err_feature_not_defined_in_class (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" is not specified in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_feature_type_does_not_exist (a_feature_name, a_type_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" specifies type ")
			Result.append_string (a_type_name.string)
			Result.append_string (", but type does not exist.")
		end

	err_feature_type_does_not_conform_to_precursor_type (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Type of feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" does not conform to the type of its precursor.")
		end

	err_feature_argument_type_does_not_exist (a_feature_name, an_argument_name, a_type_name: STRING): STRING
		do
			Result := "Feature argument "
			Result.append_string (an_argument_name.string)
			Result.append_string (" of feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" specifies type ")
			Result.append_string (a_type_name.string)
			Result.append_string (", but type does not exist.")
		end

	err_formal_generic_name_appears_more_than_once (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (" appears more than once in definition of class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_formal_generic_name_has_same_name_as_class (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" has the same name as a class or cluster in the environment.")
		end

	err_formal_generic_name_does_not_exist (a_feature_name, a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" specifies a generic name ")
			Result.append_string (a_generic_name.string)
			Result.append_string (", but the generic name does not exist.")
		end

	err_formal_generic_name_in_client_relation_does_not_exist (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Client relation specifies formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (", but the client class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" has no such formal generic name.")
		end

	err_formal_generic_name_is_bounded_by_enclosing_class (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (" is bounded by its enclosing class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_identifier_already_in_scope (an_identifier, a_class_name: STRING): STRING
		do
			Result := "Error defining identifier "
			Result.append_string (an_identifier.string)
			Result.append_string (" in assertion in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" - name is already defined in scope.")
		end

	err_identifier_in_member_range_expression_does_not_match_type_of_set (an_identifier_name, an_identifier_type, a_set_type, a_class_name: STRING): STRING
		do
			Result := "Identifier "
			Result.append_string (an_identifier_name.string)
			Result.append_string (" of type ")
			Result.append_string (an_identifier_type.string)
			Result.append_string (" does not conform to common type ")
			Result.append_string (a_set_type.string)
			Result.append_string (" of elements in enumerated set in assertion in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_infix_feature_must_have_one_argument (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Infix feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" of class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" must have exactly one argument.")
		end

	err_infix_feature_not_defined_in_class (an_operator_name, a_class_name, an_input_type: STRING): STRING
		do
			Result := "No infix feature for operator "
			Result.append_string (an_operator_name.string)
			Result.append_string (" and type ")
			Result.append_string (an_input_type.string)
			Result.append_string (" is defined in class ")
			Result.append_string (a_class_name.string)
		end

	err_input_type_does_not_conform_to_argument_type (a_class_name, a_feature_name, an_argument_name, an_input_type: STRING): STRING
		do
			Result := "Input "
			Result.append_string (an_input_type.string)
			Result.append_string (" for argument ")
			Result.append_string (an_argument_name.string)
			Result.append_string (" of feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" does not conform to type of argument.")
		end

	err_involved_class_does_not_exist (a_chart_name, an_entry_name, a_class_name: STRING): STRING
		do
			Result := "Specified class "
			Result.append_string (a_class_name.string)
			Result.append_string (" does not exist in event entry ")
			Result.append_string (an_entry_name.string)
			Result.append_string (" in event chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	err_labeled_action_already_exists_in_context (an_action_label: STRING): STRING
		do
			Result := "A labeled action with label "
			Result.append_string (an_action_label.string)
			Result.append_string (" already exists in the enclosing dynamic diagram.")
		end

	err_message_label_in_dynamic_reference_does_not_exist (a_msg_label: STRING): STRING
		do
			Result := "The referenced message label "
			Result.append_string ("'")
			Result.append_string (a_msg_label.string)
			Result.append_string ("'")
			Result.append_string (" is not defined in a scenario description.")
		end

	err_no_precursor_exists_for_feature (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is declared as redefined, but has no precursor.")
		end

	err_non_deferred_class_has_deferred_feature (a_class_name, a_feature_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_class_name.string)
			Result.append_string (" has deferred feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" but is not declared as deferred.")
		end

	err_number_of_parameters_in_named_indirection_does_not_match_number_of_type_parameters_in_class (a_class_name, a_type_name: STRING): STRING
		do
			Result := "The number of parameters in named indirection involving class "
			Result.append_string (a_class_name.string)
			Result.append_string (" does not match the number of type parameters in type ")
			Result.append_string (a_type_name.string)
			Result.append_string (".")
		end

	err_number_of_type_parameters_do_not_match (a_class_name, other_class_name: STRING): STRING
		do
			Result := "The number of type parameters for classes "
			Result.append_string (a_class_name.string)
			Result.append_string (" and ")
			Result.append_string (other_class_name.string)
			Result.append_string (" do not match.")
		end

	err_object_already_exists (an_obj_name: OBJECT_NAME): STRING
		do
			Result := "Dynamic object "
			Result.append_string (an_obj_name.string_representation.string)
			Result.append_string (" already exists in the context.")
		end

	err_object_does_not_exist (an_obj_name: STRING): STRING
		do
			Result := "Dynamic object "
			Result.append_string (an_obj_name.string)
			Result.append_string (" is not defined in the context.")
		end

	err_object_group_already_exists (a_group_name: STRING): STRING
		do
			Result := "Dynamic object group "
			Result.append_string (a_group_name.string)
			Result.append_string (" already exists in the context.")
		end

	err_object_group_does_not_exist (an_obj_name: STRING): STRING
		do
			Result := "Dynamic object group "
			Result.append_string (an_obj_name.string)
			Result.append_string (" is not defined in the context.")
		end

	err_object_stack_already_exists (a_stack_name: STRING): STRING
		do
			Result := "Dynamic object stack "
			Result.append_string (a_stack_name.string)
			Result.append_string (" already exists in the context.")
		end

	err_object_stack_does_not_exist (an_obj_name: STRING): STRING
		do
			Result := "Dynamic object stack "
			Result.append_string (an_obj_name.string)
			Result.append_string (" is not defined in the context.")
		end

	err_prefix_feature_has_argument (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Prefix feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" has more than zero arguments.")
		end

	err_prefix_group_does_not_exist (a_prefix_group, an_object: STRING): STRING
		do
			Result := "Group in prefix "
			Result.append_string (a_prefix_group.string)
			Result.append_string (" for object ")
			Result.append_string (an_object.string)
			Result.append_string (" in dynamic reference does not exist.")
		end

	err_prefix_group_does_not_match_object_group (a_prefix_group, an_object: STRING): STRING
		do
			Result := "Group prefix "
			Result.append_string (a_prefix_group.string)
			Result.append_string (" for object ")
			Result.append_string (an_object.string)
			Result.append_string (" in dynamic reference does not match the group to which the object belongs.")
		end

	err_prefix_feature_must_have_one_argument (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Prefix feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" of class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" must have exactly one argument.")
		end

	err_redefined_feature_has_deferred_precursor (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is declared as redefined, but has deferred precursor. Feature should be marked as effective.")
		end

	err_result_constant_in_class_invariant (a_class_name: STRING): STRING
		do
			Result := "Invalid use of Result keyword in class invariant in class "
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_result_constant_in_void_feature (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Invalid use of Result keyword in assertion in feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" - feature has no type.")
		end

	err_scenario_already_exists (a_scenario_name: STRING): STRING
		do
			Result := "A scenario with name "
			Result.append_string (a_scenario_name.string)
			Result.append_string (" is defined more than once.")
		end

	err_selective_export_class_does_not_exist (a_class_name, an_enclosing_class_name: STRING): STRING
		do
			Result := "Specified selective export class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in class specification ")
			Result.append_string (an_enclosing_class_name.string)
			Result.append_string (" does not exist.")
		end

	err_target_does_not_exist (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Specified target class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (" does not exist.")
		end

	err_types_in_enumerated_set_do_not_match (a_class_name: STRING): STRING
		do
			Result := "The elements in an enumerated set in class "
			Result.append_string (a_class_name.string)
			Result.append_string (" do not conform to a common type.")
		end

	err_unclassified_feature_has_precursor (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Unclassified feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" has a precursor.")
		end

	err_undefined (a_description: STRING): STRING
		do
			Result := "Undefined error: "
			Result.append_string (a_description.string)
		end

	err_void_type_in_set (a_class_name: STRING): STRING
		do
			Result := "Void or undefined type appeared in set expression in assertion in class "
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

feature -- Warnings

	warn_duplicate_creation_entry (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Duplicate entries for creation involving creator class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	warn_duplicate_event_entry (a_chart_name, a_name: STRING): STRING
		do
			Result := "Duplicate entries for event "
			Result.append_string (a_name.string)
			Result.append_string (" in event chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	warn_duplicate_scenario_entry (a_chart_name, a_name: STRING): STRING
		do
			Result := "Duplicate entries for scenario "
			Result.append_string (a_name.string)
			Result.append_string (" in scenario chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	warn_extended_id_exists (an_extended_id: STRING): STRING
		do
			Result := "A diagram with extended ID "
			Result.append_string (an_extended_id.string)
			Result := " is defined more than once."
		end

	warn_set_type_not_enumerable (a_type_name, a_class_name: STRING): STRING
		do
			Result := "Type "
			Result.append_string (a_type_name.string)
			Result.append_string (" is in involved in a set expression in an assertion in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (", but type is not enumerable. Please check that the type is correct, and if so, consider making it inherit from ENUMERABLE.")
		end

end
