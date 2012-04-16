note
	description: "A type checking warning for a textual BON type checker."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_WARNING

inherit
	ANY
		redefine
			is_equal
		end

create
	make

feature -- Initialization
	make (an_error_code: INTEGER; an_error_message: STRING)
			-- Initialize `Current'.
		do
			code := an_error_code
			message := an_error_message.string
		end

feature -- Access
	code: INTEGER
			-- What is the error code of `Current'?

	message: STRING
			-- What is the error message of `Current'?

feature -- Warning codes

	warn_code_duplicate_creation_entry,
	warn_code_duplicate_event_entry,
	warn_code_duplicate_scenario_entry,
	warn_code_extended_id_exists: INTEGER = unique

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := code = other.code
		end

end
