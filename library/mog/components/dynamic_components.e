note
	description: "A set of dynamic components."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DYNAMIC_COMPONENTS

inherit
	MOG_SET [DYNAMIC_COMPONENT]

create
	make, make_set, make_optional_rest, make_optional_first,
	make_from_set, make_from_list

end
