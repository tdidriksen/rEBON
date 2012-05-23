note
	description: "Tests for class specifications."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CLASS_SPECIFICATION

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

feature -- Test
	test_simple_class_specification
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("simple_class_spec.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			assert ("Class VEHICLE exists", type_checker.class_type_exists ("VEHICLE", type_checker.formal_type_context))
		end

	test_simple_class_specification_duplicate_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("simple_class_spec_duplicate_class.bon")
			assert_false ("Error: Type checking failed due to duplicate class", type_checker.check_bon_specification (bon_spec))
			assert ("Class already exists error occurred", error_occurred (err_code_class_exists))
		end

feature -- Test, status

	test_root_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("root_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("MACHINE", type_checker.formal_type_context) as class_type then
				assert ("class MACHINE is root class", class_type.name.is_equal ("MACHINE") and class_type.is_root)
			else
				assert ("Class was not root", False)
			end
		end

	test_deferred_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("deferred_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("VEHICLE", type_checker.formal_type_context) as class_type then
				assert ("class VEHICLE is deferred class", class_type.name.is_equal ("VEHICLE") and class_type.is_deferred)
			else
				assert ("Class was not deferred", False)
			end
		end

	test_effective_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("effective_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("CAR", type_checker.formal_type_context) as class_type then
				assert ("class CAR is root effective", class_type.name.is_equal ("CAR") and class_type.is_effective)
			else
				assert ("Class was not effective", False)
			end
		end

	test_reused_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("reused_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("MAKE", type_checker.formal_type_context) as class_type then
				assert ("class MAKE is reused class", class_type.name.is_equal ("MAKE") and class_type.is_reused)
			else
				assert ("Class was not reused", False)
			end
		end

	test_persistent_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("persistent_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("ENGINE", type_checker.formal_type_context) as class_type then
				assert ("class ENGINE is persistent class", class_type.name.is_equal ("ENGINE") and class_type.is_persistent)
			else
				assert ("Class was not persistent", False)
			end
		end

	test_interfaced_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("interfaced_class.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("HANDLING", type_checker.formal_type_context) as class_type then
				assert ("class HANDLING is interfaced class", class_type.name.is_equal ("HANDLING") and class_type.is_interfaced)
			else
				assert ("Class was not persistent", False)
			end
		end

feature -- Test, generics - unbounded

	test_generic_class_spec_one_param_unbounded
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_one_param_unbounded.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("TEST_SEQUENCE", type_checker.formal_type_context) as class_type then
				assert ("class TEST_SEQUENCE has one generic parameter E", class_type.name.is_equal ("TEST_SEQUENCE") and class_type.generics.count = 1 and class_type.has_generic_name ("E"))
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_spec_two_params_unbounded
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_two_params_unbounded.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("TEST_TABLE", type_checker.formal_type_context) as class_type then
				assert ("class TEST_TABLE has first generic parameter K", class_type.name.is_equal ("TEST_TABLE") and class_type.generics.count = 2 and class_type.generics[1].formal_generic_name.is_equal ("K"))
				assert ("class TEST_TABLE has second generic parameter V", class_type.name.is_equal ("TEST_TABLE") and class_type.generics.count = 2 and class_type.generics[2].formal_generic_name.is_equal ("V"))
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_spec_generic_name_is_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_generic_name_is_class.bon")
			assert_false ("Type checking fails because generic name exists in context", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Formal generic name is the same as class", error_occurred (err_code_formal_generic_name_has_same_name_as_class))
		end

	test_generic_class_spec_generic_name_is_other_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_generic_name_is_other_class.bon")
			assert_false ("Type checking fails because generic name exists in context", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Formal generic name is the same as an existing class", error_occurred (err_code_formal_generic_name_has_same_name_as_class))
		end

	test_generic_name_appears_more_than_once_in_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_generic_name_appears_twice.bon")
			assert_false ("Type checking fails because generic name appears more than once in class specification", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Formal generic name appears more than once", error_occurred (err_code_formal_generic_name_appears_more_than_once))
		end

feature -- Test, generics - bounded

	test_generic_class_simple_bounded
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_simple_bound.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("TCONTAINER", type_checker.formal_type_context) as class_type then
				assert ("First generic parameter E of class TCONTAINER is bounded by INTEGER",
						class_type.name.is_equal ("TCONTAINER") and
						class_type.generics.count = 1 and
						class_type.generics[1].formal_generic_name.is_equal ("E") and
						class_type.generics[1].bounding_type.name.is_equal ("INTEGER"))
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_generic_bound
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_generic_bound.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("BOUNDED_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("First generic parameter E of class BOUNDED_CONTAINER is bounded by TEST_TABLE[INTEGER, STRING]",
						class_type.name.is_equal ("BOUNDED_CONTAINER") and
						class_type.generics.count = 1 and
						class_type.generics[1].formal_generic_name.is_equal ("E") and
						class_type.generics[1].bounding_type.name.is_equal ("TEST_TABLE") and
						class_type.generics[1].bounding_type.generics.count = 2 and
						(class_type.generics[1].bounding_type.generics[1].has_actual_type and then
							class_type.generics[1].bounding_type.generics[1].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[1].bounding_type.generics[1].actual_type.generics.count = 0
						) and
						(class_type.generics[1].bounding_type.generics[2].has_actual_type and then
							class_type.generics[1].bounding_type.generics[2].actual_type.name.is_equal ("STRING") and
							class_type.generics[1].bounding_type.generics[2].actual_type.generics.count = 0)
						)
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_same_generic_bound_twice
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_same_generic_bound_twice.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("BOUNDED_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("First generic parameter E of class BOUNDED_CONTAINER is bounded by TEST_TABLE[INTEGER, STRING] and %
						%second generic parameter F of class BOUNDED_CONTAINER is bounded by TEST_TABLE[STRING, INTEGER]",
						class_type.name.is_equal ("BOUNDED_CONTAINER") and
						class_type.generics.count = 2 and
						class_type.generics[1].formal_generic_name.is_equal ("E") and
						class_type.generics[1].bounding_type.name.is_equal ("TEST_TABLE") and
						class_type.generics[1].bounding_type.generics.count = 2 and
						(class_type.generics[1].bounding_type.generics[1].has_actual_type and then
							class_type.generics[1].bounding_type.generics[1].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[1].bounding_type.generics[1].actual_type.generics.count = 0
						) and
						(class_type.generics[1].bounding_type.generics[2].has_actual_type and then
							class_type.generics[1].bounding_type.generics[2].actual_type.name.is_equal ("STRING") and
							class_type.generics[1].bounding_type.generics[2].actual_type.generics.count = 0) and
						class_type.generics[2].formal_generic_name.is_equal ("F") and
						class_type.generics[2].bounding_type.name.is_equal ("TEST_TABLE") and
						class_type.generics[2].bounding_type.generics.count = 2 and
						(class_type.generics[2].bounding_type.generics[1].has_actual_type and then
							class_type.generics[2].bounding_type.generics[1].actual_type.name.is_equal ("STRING") and
							class_type.generics[2].bounding_type.generics[1].actual_type.generics.count = 0) and
						(class_type.generics[2].bounding_type.generics[2].has_actual_type and then
							class_type.generics[2].bounding_type.generics[2].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[2].bounding_type.generics[2].actual_type.generics.count = 0)
						)
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_bounded_by_generic_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_bounded_by_generic_name.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("BOUNDED_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("class BOUNDED_CONTAINER second parameter F is bounded by TEST_TABLE[E, INTEGER]",
						class_type.name.is_equal ("BOUNDED_CONTAINER") and
						class_type.generics.count = 2 and
						class_type.generics[2].formal_generic_name.is_equal ("F") and
						class_type.generics[2].bounding_type.name.is_equal ("TEST_TABLE") and
						class_type.generics[2].bounding_type.generics.count = 2 and
						(class_type.generics[2].bounding_type.generics[1].has_actual_type and then
							class_type.generics[2].bounding_type.generics[1].actual_type.name.is_equal ("TEST_TABLE") and
							class_type.generics[2].bounding_type.generics[1].actual_type.generics.count = 2 and
							class_type.generics[2].bounding_type.generics[1].actual_type.generics[1].has_actual_type and then
							class_type.generics[2].bounding_type.generics[1].actual_type.generics[1].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[2].bounding_type.generics[1].actual_type.generics[2].has_actual_type and then
							class_type.generics[2].bounding_type.generics[1].actual_type.generics[2].actual_type.name.is_equal ("STRING")
						) and
						(class_type.generics[2].bounding_type.generics[2].has_actual_type and then
							class_type.generics[2].bounding_type.generics[2].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[2].bounding_type.generics[2].actual_type.generics.count = 0)
						)
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_bounded_by_unbounded_generic_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_bounded_by_unbounded_generic_name.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("BOUNDED_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("class BOUNDED_CONTAINER second parameter F is bounded by TEST_TABLE[E, INTEGER]",
						class_type.name.is_equal ("BOUNDED_CONTAINER") and
						class_type.generics.count = 2 and
						class_type.generics[2].formal_generic_name.is_equal ("F") and
						class_type.generics[2].bounding_type.name.is_equal ("TEST_TABLE") and
						class_type.generics[2].bounding_type.generics.count = 2 and
						(class_type.generics[2].bounding_type.generics[1].has_actual_type and then
							class_type.generics[2].bounding_type.generics[1].actual_type.name.is_equal ("ANY")
						) and
						(class_type.generics[2].bounding_type.generics[2].has_actual_type and then
							class_type.generics[2].bounding_type.generics[2].actual_type.name.is_equal ("INTEGER") and
							class_type.generics[2].bounding_type.generics[2].actual_type.generics.count = 0)
						)
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_name_is_bounded_by_right_generic_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_bounded_by_right_generic_name.bon")
			assert_false ("Type checking fails because generic class is bounded by generic name to the right of it", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class is bounded by generic name to the right of it", error_occurred (err_code_class_does_not_exist))
		end

	test_generic_name_only_bounded_by_other_generic_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_name_only_bounded_by_other_name.bon")
			assert_false ("Type checking fails because generic name is bounded solely by other generic name", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic name is bounded solely by other generic name", error_occurred (err_code_class_does_not_exist))
		end

	test_generic_name_is_bounded_by_non_existing_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_simple_bounded_by_non_existing_class.bon")
			assert_false ("Type checking fails because generic class is bounded by non-existing_class", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class is bounded by non-existing class", error_occurred (err_code_class_does_not_exist))
		end

	test_generic_class_is_bounded_by_itself
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_simple_bounded_by_itself.bon")
			assert_false ("Type checking fails because generic class is bounded by itself", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class is bounded by itself", error_occurred (err_code_formal_generic_name_is_bounded_by_enclosing_class))
		end

	test_generic_class_bound_has_incorrect_number_of_type_parameters
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_spec_incorrect_number_of_type_parameters.bon")
			assert_false ("Type checking fails because generic class bound has incorrect number of type parameters", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class has incorrect number of type parameters", error_occurred (err_code_number_of_type_parameters_do_not_match))
		end

feature -- Test, generics - bounds conformance

	test_generic_class_simple_bounds_do_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_simple_bounds_do_not_conform.bon")
			assert_false ("Type checking fails because bounds of generic classes do not conform", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class has generic name with non-conforming bound", error_occurred (err_code_actual_type_does_not_match_bounding_type))
		end

	test_generic_class_simple_bounds_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_simple_bounds_conform.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("CONFORMING_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("class CONFORMING_CONTAINER bound INTEGER first parameter J conforms to parameter bound REAL of first parameter of TCONTAINER",
						class_type.name.is_equal ("CONFORMING_CONTAINER") and
						class_type.generics.count = 2 and
						class_type.generics[1].formal_generic_name.is_equal ("J") and
						class_type.generics[1].bounding_type.name.is_equal ("INTEGER") and

						(class_type.generics[2].bounding_type.name.is_equal ("TCONTAINER") and
						class_type.generics[2].bounding_type.generics.count = 1) and then
						(class_type.generics[2].bounding_type.generics[1].bounding_type.name.is_equal ("REAL") and
						class_type.generics[2].bounding_type.generics[1].is_valid_actual_type (class_type.generics[1].bounding_type)
						))
			else
				assert ("Class did not exist", False)
			end
		end

	test_generic_class_nested_bounds_do_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_nested_bounds_do_not_conform.bon")
			assert_false ("Type checking fails because nested bounds of generic classes do not conform", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Generic class has generic name with non-conforming bound", error_occurred (err_code_actual_type_does_not_match_bounding_type))
		end

	test_generic_class_nested_bounds_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("generic_class_nested_bounds_conform.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("CONFORMING_CONTAINER", type_checker.formal_type_context) as class_type then
				assert ("class CONFORMING_CONTAINER bound INTEGER first parameter J of type TEST_SEQUENCE[INTEGER] conforms to parameter bound TEST_SEQUENCE[INTEGER] of first parameter of TCONTAINER",
						class_type.name.is_equal ("CONFORMING_CONTAINER") and
						class_type.generics.count = 2 and
						class_type.generics[1].formal_generic_name.is_equal ("J") and
						class_type.generics[1].bounding_type.name.is_equal ("TEST_SEQUENCE") and
						class_type.generics[1].bounding_type.generics[1].actual_type.name.is_equal ("INTEGER") and

						(class_type.generics[2].bounding_type.name.is_equal ("TCONTAINER") and
						class_type.generics[2].bounding_type.generics.count = 1) and then
						(class_type.generics[2].bounding_type.generics[1].bounding_type.name.is_equal ("TEST_SEQUENCE") and
						class_type.generics[2].bounding_type.generics[1].bounding_type.generics[1].actual_type.name.is_equal ("INTEGER") and
						class_type.generics[2].bounding_type.generics[1].is_valid_actual_type (class_type.generics[1].bounding_type)
						))
			else
				assert ("Class did not exist", False)
			end
		end

end
