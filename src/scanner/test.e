note
	description: "Summary description for {TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class TEST

inherit
	ARGUMENTS

create
	make

feature
	make
		local
			fin: KL_TEXT_INPUT_FILE
			scanner: BON_SCANNER
		do
			--create fin.make_open_read ("connector.bon")
			create scanner.make_scanner
			create fin.make (argument(1))
			fin.open_read
			scanner.set_input_buffer (scanner.new_file_buffer(fin))
			scanner.scan
			--fin.close
		end

end -- class TEST
