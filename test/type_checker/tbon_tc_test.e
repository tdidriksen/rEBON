note
	description: "Shared items for all type checker test classes."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TEST

inherit
	TBON_TC_ERROR

feature -- Access
	parser: BON_PARSER

	type_checker: TEXTUAL_BON_TYPE_CHECKER

feature -- Setup
	set_up
			-- Do this before _first_ test.
		do
			create parser.make_parser
		end

	bon_specification_from_file (a_filename: STRING): BON_SPECIFICATION
			-- Get a BON specification from `a_filename'.
		local
			a_file: KL_TEXT_INPUT_FILE
			filename: STRING
		do
			filename := a_filename.string
			if prepend_exec_path then
				filename.prepend_string (exec_path)
			else
				filename.prepend_string (project_path)
			end
			create a_file.make (filename)
			a_file.open_read
			if a_file.is_open_read then
				parser.reset_scanner
				parser.set_input_buffer (parser.new_file_buffer (a_file))
				parser.parse
				a_file.close
			else
				io.set_error_default
				io.put_string ("bon_parser: cannot read %'")
				io.put_string (filename)
				io.put_string ("%'%N")
			end
			Result := parser.bon_specification
		end

	set_up_test
			-- Do this before _every_ test.
		do
			create type_checker.make
		end

feature -- Constants

	prepend_exec_path: BOOLEAN = True
			-- Should the exec_path be prepended to the path?
			-- True implies that tests should be run from command line. False implies they should be run in EiffelStudio

	exec_path: STRING = "../../../bon/"
			-- Path to BON files from executable library.

	project_path: STRING = "bon/"
			-- Path to BON files from .ecf file.

feature -- Status report

	error_occurred (an_error_code: INTEGER): BOOLEAN
		do
			Result := type_checker.errors.has (create {TBON_TC_ERROR}.make (an_error_code, Void))
		end

end
