note
	description: "Tests for static relations."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_STATIC_RELATIONS

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

feature -- Test, static references

feature -- Test, inheritance relations
	test_inheritance_relation_child_inherits_from_parent
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("inheritance_relation_child_inherits_from_parent.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("A", type_checker.formal_type_context) as child then
				if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("B", type_checker.formal_type_context) as parent then
						assert ("Class A inherits from class B",
							child.ancestors.exists (
								agent (l_class, other_class: TBON_TC_CLASS_TYPE): BOOLEAN
									do
										Result := l_class.is_equal (other_class)
									end (?, parent)
							) and then
							child.conforms_to (parent)
						)
				else
					assert ("Parent class did not exist", False)
				end
			else
				assert ("Child class did not exist", False)
			end
		end

	test_inheritance_relation_child_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("inheritance_relation_child_does_not_exist.bon")
			assert_false ("Type checking fails because child class does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: child class does not exist", error_occurred (err_code_class_does_not_exist))
		end

	test_inheritance_relation_parent_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("inheritance_relation_parent_does_not_exist.bon")
			assert_false ("Type checking fails because child class does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: child class does not exist", error_occurred (err_code_class_does_not_exist))
		end

	test_inheritance_relation_invalid_multiplicity
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("inheritance_relation_invalid_multiplicity.bon")
			assert_false ("Type checking fails because an invalid multiplicity relation was specified", type_checker.check_bon_specification (bon_spec))
			assert ("Error: an invalid multiplicity relation was specified", error_occurred (err_code_invalid_multiplicity))
		end

	test_inheritance_relation_valid_multiplicity
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("inheritance_relation_valid_multiplicity.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
		end

feature -- Test, client relations

	test_client_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/client_does_not_exist.bon")
			assert_false ("Type checking fails because a client does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: client does not exist", error_occurred (err_code_class_does_not_exist))
		end

	test_supplier_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/supplier_does_not_exist.bon")
			assert_false ("Type checking fails because a supplier does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: supplier does not exist", error_occurred (err_code_class_does_not_exist))
		end

	test_client_static_reference_fail
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/client_static_reference_fail.bon")
			assert_false ("Type checking fails because a referenced cluster in a prefix does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: prefix client cluster failed", error_occurred (err_code_cluster_in_prefix_does_not_exist))
		end

	test_supplier_static_reference_fail
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/supplier_static_reference_fail.bon")
			assert_false ("Type checking fails because a referenced cluster in a prefix does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: prefix supplier cluster failed", error_occurred (err_code_cluster_in_prefix_does_not_exist))
		end

	test_feature_name_does_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/feature_name_does_exist.bon")
			assert ("Type checking is successful.", type_checker.check_bon_specification (bon_spec))
			assert ("A is in context.", type_checker.class_type_exists ("A", type_checker.formal_type_context))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("B", type_checker.formal_type_context) as type then
				assert ("Feature C exists in A", type.features.exists (agent (a_feature: TBON_TC_FEATURE): BOOLEAN do Result := a_feature.name ~ "c" end))
			else
				assert ("B is in context.", False)
			end
		end

	test_feature_name_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/feature_name_does_not_exist.bon")
			assert_false ("Type checking fails because a used feature name does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: used feature name does not exist", error_occurred (err_code_feature_not_defined_in_class))
		end

	test_some_feature_name_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/some_feature_name_does_not_exist.bon")
			assert_false ("Type checking fails because a used feature name does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: used feature name does not exist", error_occurred (err_code_feature_not_defined_in_class))
		end

	test_parent_ind_formal_generic_name_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/parent_ind_formal_generic_name_does_not_exist.bon")
			assert_false ("Type checking fails because a formal generic name in a client reation does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Formal generic in client relation does not exist", error_occurred (err_code_formal_generic_name_in_client_relation_does_not_exist))
		end

	test_supplier_ind_formal_generic_name_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/supplier_ind_formal_generic_name_does_not_exist.bon")
			assert_false ("Type checking fails because a formal generic name in a client reation does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Formal generic in client relation does not exist", error_occurred (err_code_formal_generic_name_in_client_relation_does_not_exist))
		end

	test_parent_ind_formal_generic_name_does_exist
		local
			bon_spec: BON_SPECIFICATION
			l_formal_generic_name: TBON_TC_GENERIC
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/parent_ind_formal_generic_name_does_exist.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("B", type_checker.formal_type_context) as a_class then
				create l_formal_generic_name.make ("G", Void, a_class)
				assert("B has generic type G", a_class.generics.has (l_formal_generic_name))
			end
		end

	test_supplier_ind_formal_generic_name_does_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/supplier_ind_formal_generic_name_does_exist.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("B", type_checker.formal_type_context) as a_class then
				assert("B has generic type G", a_class.has_generic_name ("G"))
			end
		end

	test_class_name_in_named_indirection_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/class_name_in_named_indirection_does_not_exist.bon")
			assert_false ("Type checking fails because name in named indirection does not exist.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Class does not exist",error_occurred (err_code_class_does_not_exist))
		end

	test_class_name_in_named_indirection_does_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/class_name_in_named_indirection_does_exist.bon")
			assert ("Type checking passes.", type_checker.check_bon_specification (bon_spec))
		end

	test_named_indirection
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/named_indirection.bon")
			assert_false ("Type checking fails.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: named indirection not correct",error_occurred (err_code_actual_type_does_not_match_bounding_type))
		end


	test_named_indirection_class_name_does_not_conform
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("client_relations/named_indirection_class_name_does_not_conform.bon")
			assert_false ("Type checking fails.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: named indirection not correct",error_occurred (err_code_argument_types_do_not_match_precursor))
		end
end
