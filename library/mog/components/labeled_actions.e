note
	description: "A set of labeled actions."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LABELED_ACTIONS

inherit
	MOG_SET [LABELED_ACTION]

create
	make, make_set, make_optional_rest, make_optional_first,
	make_from_set, make_from_list

end
