note
	description: "A list of feature arguments."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEATURE_ARGUMENT_LIST

inherit
	MOG_LIST [FEATURE_ARGUMENT]

create
	make_list, make_optional_rest, make_optional_first

end
