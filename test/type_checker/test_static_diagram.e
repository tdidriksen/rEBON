note
	description: "Tests for static diagrams."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_STATIC_DIAGRAM

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
	test_empty_static_diagram
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("empty_static_diagram.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
		end

	test_empty_static_diagram_with_id_and_comment
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("empty_static_diagram_with_id_and_comment.bon")
			assert ("Type checking succeeded", type_checker.check_bon_specification (bon_spec))
		end

end
