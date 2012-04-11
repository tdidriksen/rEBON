note
	description: "A list of variable ranges."
	author: ""
	date: "$Date: 2005/05/02 22:58:31 $"
	revision: "$Revision: 1.1 $"

class
	VARIABLE_RANGE_LIST

inherit
	MOG_LIST [VARIABLE_RANGE]

create
	make_list, make_optional_rest, make_optional_first

end -- class VARIABLE_RANGE_LIST
