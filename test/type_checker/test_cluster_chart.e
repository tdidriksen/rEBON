note
	description: "Tests for cluster charts"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CLUSTER_CHART

inherit
	TS_TEST_CASE
		redefine
			set_up
		end

create
	make_default

feature -- Access
	parser: BON_PARSER

	type_checker: TEXTUAL_BON_TYPE_CHECKER

feature -- Setup
	set_up
		do
			create parser.make_parser
		end

	bon_specification_from_file (a_filename: STRING): BON_SPECIFICATION
			-- Get a BON specification from `a_filename'
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_file.make (a_filename)
			a_file.open_read
			if a_file.is_open_read then
				parser.reset_scanner
				parser.set_input_buffer (parser.new_file_buffer (a_file))
				parser.parse
				a_file.close
			else
				io.set_error_default
				io.put_string ("bon_parser: cannot read %'")
				io.put_string (a_filename)
				io.put_string ("%'%N")
			end
			Result := parser.bon_specification
		end

feature -- Test
	test_true
		local
			bon_spec: BON_SPECIFICATION
		do
			
			assert ("True", True)
		end

end
