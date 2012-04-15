note
	description: "A manifest string."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MANIFEST_STRING

inherit
	MANIFEST_CONSTANT
		undefine
			is_equal,
			copy,
			out
		end

	STRING

create
	make_from_string

feature -- Access
	value: like Current
		do
			Result := Current.twin
		end

end
