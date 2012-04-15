note
	description: "A Current token, referring to the current class."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CURRENT_CONSTANT

inherit
	CONSTANT_TOKEN

create
	make

feature -- Initialization
	make
			-- Initialize `Current'.
		do
			my_string_representation := "Current"
		end

end
