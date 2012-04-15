note
	description: "A Void token describing a Void value."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VOID_CONSTANT

inherit
	CONSTANT_TOKEN

create
	make

feature -- Initialization
	make
			-- Initialize `Current'.
		do
			my_string_representation := "Void"
		end

end
