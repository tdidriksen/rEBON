note
	description: "Tests for formal assertions."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_FORMAL_ASSERTIONS

inherit
	TS_TEST_CASE
		undefine
			set_up
		end

	TBON_TC_TEST
		undefine
			is_equal
		end

create
	make_default

feature -- Test, quantification
     test_member_range_duplicate_identifiers
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/member_range_duplicate_identifiers.bon")
    		assert_false ("Type checking fails because of duplicate identifiers", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: duplicate identifiers", error_occurred(err_code_duplicate_identifiers))
    	end

     test_identifier_already_in_scope
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/identifier_already_in_scope.bon")
    		assert_false ("Type checking fails because of identifier already is in scope", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: identifier is already in scope", error_occurred(err_code_identifier_already_in_scope))
    	end

     test_enumerated_set_types_conform
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/enumerated_set_types_conform.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_enumerated_set_types_do_not_conform
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/enumerated_set_types_do_not_conform.bon")
    		assert_false ("Type checking fails because types in set do not conform", type_checker.check_bon_specification (bon_spec))
    	   	assert ("Error: types in set do not conform", error_occurred(err_code_types_in_enumerated_set_do_not_match))
    	end

     test_enumerated_set_has_integer_interval
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/enumerated_set_has_integer_interval.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_enumerated_set_has_character_interval
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/enumerated_set_has_character_interval.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_call_type_is_enumerable
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_type_is_enumerable.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("SEQUENCE", type_checker.informal_type_context) as l_class then
    		    assert("SEQUENCE inherits from ENUMERABLE", l_class.ancestors.exists (
    		        agent (l_type: TBON_TC_CLASS_TYPE): BOOLEAN
    		            do
    		                Result := l_type.name.is_equal ("ENUMERABLE")
    		            end
    		    ))
    		else
    		    assert ("Class did not exist", False)
    		end
    	end

     test_call_type_is_not_enumerable
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_type_is_not_enumerable.bon")
    		assert_false ("Type checking succeeds with a warning", type_checker.check_bon_specification (bon_spec))
    		assert ("Warning: type in set expression is not enumerable", warning_occurred(warn_code_set_type_not_enumerable))
    	end

     test_type_of_identifier_does_not_match_type_of_set
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/type_of_identifier_does_not_match_type_of_set.bon")
    		assert_false ("Type checking fails because type of identifier does not match type of set", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: type of identifier does not match type of set", error_occurred(err_code_identifier_in_member_range_expression_does_not_match_type_of_set))
    	end

     test_type_range_type_exists
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/type_range_type_exists.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_type_range_type_does_not_exist
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/type_range_type_does_not_exist.bon")
    		assert_false ("Type checking fails because type in type range does not exist", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: type in type range does not exist", error_occurred(err_code_class_does_not_exist))
    	end

      test_restriction_type_is_boolean
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/restriction_type_is_boolean.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_restriction_type_is_not_boolean
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/restriction_type_is_not_boolean.bon")
    		assert_false ("Type checking fails because type of restriction is not boolean", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: type of restriction is not boolean", error_occurred(err_code_type_of_restriction_is_non_boolean))
    	end

     test_proposition_type_is_boolean
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/proposition_type_is_boolean.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_proposition_type_is_not_boolean
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/proposition_type_is_not_boolean.bon")
    		assert_false ("Type checking fails because type of proposition is not boolean", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: type of proposition is not boolean", error_occurred(err_code_type_of_proposition_is_non_boolean))
    	end

feature -- Test, calls
     test_call_arguments_conform
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_arguments_conform.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_call_arguments_do_not_conform
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_arguments_do_not_conform.bon")
    		assert_false ("Type checking fails because type of arguments do not conform", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: type of proposition is not boolean", error_occurred(err_code_type_of_actual_argument_does_not_conform_to_defined_type))
    	end

     test_call_in_precondition_is_argument
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_in_precondition_is_argument.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_call_in_precondition_is_enclosing_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_in_precondition_is_feature.bon")
    		assert_false ("Type checking fails because precondition calls enclosing feature", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: precondition calls enclosing feature", error_occurred(err_code_feature_calls_itself_in_pre_or_postcondition))
    	end

     test_call_in_precondition_is_Result
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_in_precondition_is_Result.bon")
    		assert_false ("Type checking fails because Result appears in precondition", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: Result appears in precondition", False)
    	end

     test_call_in_postcondition_is_feature_argument
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_in_postcondition_is_feature_argument.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_call_in_postcondition_is_enclosing_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_in_postcondition_is_feature.bon")
    		assert_false ("Type checking fails because postcondition calls enclosing feature", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: postcondition calls enclosing feature", error_occurred(err_code_feature_calls_itself_in_pre_or_postcondition))
    	end

     test_call_no_of_arguments_do_not_match
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_no_of_arguments_do_not_match.bon")
    		assert_false ("Type checking fails because number of arguments in call do not match definition", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: number of arguments in call do not match definition", error_occurred(err_code_number_of_arguments_to_feature_in_call_is_wrong))
    	end

     test_call_identifier_does_not_exist
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_identifier_does_not_exist.bon")
    		assert_false ("Type checking fails because identifier in call does not exist", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: identifier in call does not exist", error_occurred(err_code_called_identifier_does_not_exist))
    	end

     test_call_involves_feature_with_no_type
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_involves_feature_with_no_type.bon")
    		assert_false ("Type checking fails because call involves identifier with no type", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: call involves identifier with no type", error_occurred(err_code_assertion_involves_call_with_no_type))
    	end

     test_call_with_parenthesized_qualifier
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_with_parenthesized_qualifier.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_call_with_parenthesized_qualifier_feature_not_available
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_with_parenthesized_qualifier_feature_not_available.bon")
    		assert_false ("Type checking fails because call on parenthesized qualifier is not available", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: call on parenthesized qualifier is not available", error_occurred(err_code_called_identifier_does_not_exist))
    	end

     test_call_to_inherited_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/call_to_inherited_feature.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

feature -- Test, unary expressions
     test_unary_expression_type_has_prefix_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/unary_expression_type_has_prefix_feature.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_unary_expression_type_does_not_have_prefix_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/unary_expression_type_does_not_have_prefix_feature.bon")
    		assert_false ("Type checking fails because call unary expression does not have prefix feature", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: unary expression does not have prefix feature", error_occurred (err_code_unary_operator_is_not_defined_for_type))
    	end

feature -- Test, binary expressions

     test_binary_expression_type_has_infix_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/binary_expression_type_has_infix_feature.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_binary_expression_type_does_not_have_infix_feature
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/binary_expression_type_does_not_have_infix_feature.bon")
    		assert_false ("Type checking fails because call binary expression does not have infix feature", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: binary expression does not have infix feature", error_occurred (err_code_infix_feature_not_defined_in_class))
    	end

     test_binary_expression_argument_does_not_conform
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("formal_assertions/binary_expression_argument_does_not_conform.bon")
    		assert_false ("Type checking fails because argument to infix feature does not conform to defined type", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: argument to infix feature does not conform to defined type", error_occurred (err_code_infix_feature_not_defined_in_class))
    	end

end
