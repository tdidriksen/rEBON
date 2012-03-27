note
	description: "A list of constraints."

class
	CONSTRAINT_LIST

inherit
	MOG_LIST [STRING]

create
	make_list, make_optional_rest, make_optional_first,
	make_from_list, make_from_set, make_from_string_list,
	make_from_linear

feature -- Initialization

	make_from_string_list (a_list: CONSTRAINT_LIST)
			-- Initialize `Current' to the contents of 'a_list'.
		do
			make_from_list (a_list)
		ensure
			is_equal (a_list)
		end

end -- class CONSTRAINT_LIST
