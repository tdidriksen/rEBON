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

	test_generic_feature_type_do_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("feature_type_generic_does_not_conform.bon")
			assert_false ("Type checking fails because generic feature type does not conform to precursor type", type_checker.check_bon_specification (bon_spec))
			assert ("Error: generic feature type does not conform to precursor type", error_occurred (err_code_feature_type_does_not_conform_to_precursor_type))
		end

end
