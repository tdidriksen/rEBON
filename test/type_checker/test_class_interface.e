note
	description: "Tests for class interfaces."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CLASS_INTERFACE

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

feature -- Test inheritance

	test_circular_inheritance
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("formal_circular_inheritance.bon")
			assert_false ("Type checking fails because class inherits from itself", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Class inherits from itself", error_occurred (err_code_class_inherits_from_itself))
		end

	test_repeated_inheritance
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("formal_repeated_inheritance.bon")
			assert ("Type checking suceeded", type_checker.check_bon_specification (bon_spec))
		end

feature -- Test, feature
	test_duplicate_feature
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("duplicate_feature_name.bon")
			assert_false ("Type checking fails because of duplicate feature name in class", type_checker.check_bon_specification (bon_spec))
			assert ("Error: duplicate feature name", error_occurred (err_code_duplicate_feature_name))
		end

	test_duplicate_feature_inherited
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("duplicate_feature_name_inherited.bon")
			assert_false ("Type checking fails because of duplicate feature name due to inheritance", type_checker.check_bon_specification (bon_spec))
			assert ("Error: duplicate feature name due to inheritance", error_occurred (err_code_duplicate_feature_name_inherited))
		end

	test_prefix_feature_has_arguments
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("prefix_has_arguments.bon")
			assert_false ("Type checking fails because prefix feature has arguments", type_checker.check_bon_specification (bon_spec))
			assert ("Error: prefix feature has arguments", error_occurred (err_code_prefix_feature_has_argument))
		end

	test_feature_has_non_existing_type
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_has_non_existing_type.bon")
			assert_false ("Type checking fails because feature has non-existing type", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature has non-existing type", error_occurred (err_code_feature_type_does_not_exist))
		end

feature -- Test, feature arguements

	test_positive_feature_arguments
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_arguments.bon")
			assert ("Type checking is successful.", type_checker.check_bon_specification (bon_spec))
		end

	test_effective_feature_argument_does_not_conform_to_parent
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("effective_feature_argument_does_not_conform_to_parent.bon")
			assert_false ("Type checking fails because inherited feature argument type does not conform to parent", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument type does not conform", error_occurred(err_code_argument_types_do_not_match_precursor))
		end

	test_effective_feature_has_wrong_number_of_arguments
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("effective_feature_has_wrong_number_of_arguments.bon")
			assert_false ("Type checking fails because redefined feature has wrong number of arguments", type_checker.check_bon_specification (bon_spec))
			assert ("Error: redefined feature has wrong number of arguments", error_occurred(err_code_argument_types_do_not_match_precursor))
		end

	test_feature_argument_has_unknown_type
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_argument_has_unknown_type.bon")
			assert_false ("Type checking fails because feature argument has an unkown type", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument name is keyword", error_occurred(err_code_class_does_not_exist))
		end

	test_feature_argument_name_is_keyword_current
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_argument_is_keyword_current.bon")
			assert_false ("Type checking fails because feature argument is current", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument name is keyword", error_occurred(err_code_feature_argument_name_is_keyword_current))
		end

	test_feature_argument_name_is_keyword_result
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_argument_is_keyword_result.bon")
			assert_false ("Type checking fails because feature argument is result", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument name is keyword", error_occurred(err_code_feature_argument_name_is_keyword_result))
		end

	test_feature_argument_name_is_keyword_void
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_argument_is_keyword_void.bon")
			assert_false ("Type checking fails because feature argument is void", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument name is keyword", error_occurred(err_code_feature_argument_name_is_keyword_void))
		end

	test_feature_has_duplicate_arguments
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_has_duplicate_arguments.bon")
			assert_false ("Type checking fails because feature has duplicated argument names", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature has duplicate arguments", error_occurred(err_code_duplicate_argument_name))
		end

	test_redefined_feature_argument_does_not_conform_to_parent
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("redefined_feature_argument_does_not_conform_to_parent.bon")
			assert_false ("Type checking fails because inherited feature argument type does not conform to parent", type_checker.check_bon_specification (bon_spec))
			assert ("Error: feature argument type does not conform", error_occurred(err_code_argument_types_do_not_match_precursor))
		end

feature -- Test, feature status
	test_non_deferred_class_has_deferred_features
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("non_deferred_class_has_deferred_feature.bon")
			assert_false ("Type checking fails because non-deferred class has deferred feature", type_checker.check_bon_specification (bon_spec))
			assert ("Error: non-deferred class has deferred feature", error_occurred (err_code_non_deferred_class_has_deferred_feature))
		end

	test_effective_feature_has_non_deferred_precursor
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("effective_feature_has_non_deferred_precursor.bon")
			assert_false ("Type checking fails because effective feature has non-deferred precursor", type_checker.check_bon_specification (bon_spec))
			assert ("Error: effective feature has non-deferred precursor", error_occurred (err_code_effective_feature_has_non_deferred_precursor))
		end

	test_redefined_feature_has_deferred_precursor
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("redefined_feature_has_deferred_precursor.bon")
			assert_false ("Type checking fails because redefined feature has deferred precursor", type_checker.check_bon_specification (bon_spec))
			assert ("Error: redefined feature has deferred precursor", error_occurred (err_code_redefined_feature_has_deferred_precursor))
		end

	test_unclassified_feature_has_precursor
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("unclassified_feature_has_precursor.bon")
			assert_false ("Type checking fails because unclassified feature has precursor", type_checker.check_bon_specification (bon_spec))
			assert ("Error: unclassified feature has precursor", error_occurred (err_code_unclassified_feature_has_precursor))
		end

feature -- Test, feature type

	test_simple_feature_type_do_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_type_simple_does_not_conform.bon")
			assert_false ("Type checking fails because simple feature type does not conform to precursor type", type_checker.check_bon_specification (bon_spec))
			assert ("Error: simple feature type does not conform to precursor type", error_occurred (err_code_feature_type_does_not_conform_to_precursor_type))
		end

	test_simple_feature_types_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_type_simple_conform.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("C", type_checker.formal_type_context) as class_type then
				assert ("Type C of feature id in class C conforms to type B of precursor",
						class_type.feature_with_name ("id", False, False) /= Void and then
						class_type.feature_with_name ("id", False, False).type.name.is_equal ("C") and
						class_type.feature_with_name ("id", False, False).nearest_precursor /= Void and then
						(class_type.feature_with_name ("id", False, False).nearest_precursor.name.is_equal ("id") and
						class_type.feature_with_name ("id", False, False).nearest_precursor.type.name.is_equal ("B") and
						class_type.feature_with_name ("id", False, False).type.conforms_to (class_type.feature_with_name ("id", False, False).nearest_precursor.type)
						))

			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_feature_type_do_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_type_generic_does_not_conform.bon")
			assert_false ("Type checking fails because generic feature type does not conform to precursor type", type_checker.check_bon_specification (bon_spec))
			assert ("Error: generic feature type does not conform to precursor type", error_occurred (err_code_feature_type_does_not_conform_to_precursor_type))
		end

-- Test generic feature types conform
-- Test not aggregation with enclosing class
end
