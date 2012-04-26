note
	description: "Tests for class specifications."
	author: ""
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
		end

end
