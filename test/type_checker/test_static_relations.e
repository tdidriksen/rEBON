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
	test_inheritance_realtion_child_inherits_from_parent
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
			assert ("Error: an invalid multiplicity relation was specified", False) --error_occurred (err_code_class_does_not_exist))
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

end
