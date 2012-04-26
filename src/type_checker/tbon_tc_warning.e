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
	make (an_error_code: INTEGER; a_warning_message: STRING)
			-- Initialize `Current'.
		do
			code := an_error_code
			if a_warning_message /= Void then
				message := a_warning_message.string
			end
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
	warn_code_extended_id_exists,
	warn_code_set_type_not_enumerable: INTEGER = unique

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := code = other.code
		end

end
