note
	description: "A type checking error for a textual BON type checker."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_ERROR

inherit
	ANY
		redefine
			is_equal
		end

create
	make

feature -- Initialization
	make (an_error_code: INTEGER; an_error_message: STRING)
			-- Initialize `Current'.
		do
			code := an_error_code
			if an_error_message /= Void then
				message := an_error_message.string
			end
		end

feature -- Access
	code: INTEGER
			-- What is the error code of `Current'?

	message: STRING
			-- What is the error message of `Current'?

feature -- Error codes

	err_code_actual_type_does_not_match_bounding_type,
	err_code_ancestor_does_not_exist,
	err_code_argument_has_same_name_as_feature ,
	err_code_argument_type_does_not_exist,
	err_code_argument_types_do_not_match_precursor,
	err_code_assertion_involves_call_with_no_type,
	err_code_class_already_in_cluster,
	err_code_class_does_not_exist,
	err_code_class_does_not_inherit_from_class,
	err_code_class_exists,
	err_code_class_inherits_from_itself,
	err_code_class_not_in_cluster,
	err_code_class_not_in_specified_cluster,
	err_code_cluster_already_in_cluster,
	err_code_cluster_already_in_system_chart,
	err_code_cluster_does_not_exist,
	err_code_cluster_exists,
	err_code_cluster_contains_itself,
	err_code_cluster_in_both_cluster_and_system,
	err_code_cluster_not_in_cluster_or_system,
	err_code_creator_does_not_exist,
	err_code_duplicate_argument_name,
	err_code_duplicate_feature_name,
	err_code_duplicate_identifiers,
	err_code_duplicate_inherited_feature_name,
	err_code_enclosing_class_not_generic,
	err_code_feature_argument_type_does_not_exist,
	err_code_feature_not_defined_in_class,
	err_code_feature_type_does_not_exist,
	err_code_formal_generic_name_is_bounded_by_enclosing_class,
	err_code_formal_generic_name_appears_more_than_once,
	err_code_formal_generic_name_has_same_name_as_class,
	err_code_formal_generic_name_does_not_exist,
	err_code_identifier_already_in_scope,
	err_code_identifier_in_member_range_expression_does_not_match_type_of_set,
	err_code_infix_feature_must_have_one_argument,
	err_code_infix_feature_not_defined_in_class,
	err_code_input_type_does_not_conform_to_argument_type,
	err_code_involved_class_does_not_exist,
	err_code_labeled_action_already_exists_in_context,
	err_code_message_label_in_dynamic_reference_does_not_exist,
	err_code_no_precursor_exists_for_feature,
	err_code_number_of_parameters_in_named_indirection_does_not_match_number_of_type_parameters_in_class,
	err_code_number_of_type_parameters_do_not_match,
	err_code_object_already_exists,
	err_code_object_does_not_exist,
	err_code_object_group_does_not_exist,
	err_code_object_group_already_exists,
	err_code_object_stack_already_exists,
	err_code_object_stack_does_not_exist,
	err_code_prefix_feature_must_have_one_argument,
	err_code_prefix_group_does_not_exist,
	err_code_prefix_group_does_not_match_object_group,
	err_code_result_constant_in_class_invariant,
	err_code_result_constant_in_void_feature,
	err_code_scenario_already_exists,
	err_code_selective_export_class_does_not_exist,
	err_code_target_does_not_exist,
	err_code_types_in_enumerated_set_do_not_match,
	err_code_undefined,
	err_code_void_type_in_set: INTEGER = unique

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := code = other.code
		end


end
