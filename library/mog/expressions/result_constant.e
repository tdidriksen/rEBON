note
	description: "A Result token, referring to the result of a function."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RESULT_CONSTANT

inherit
	CONSTANT_TOKEN

create
	make

feature -- Initialization
	make
			-- Initialize `Current'.
		do
			my_string_representation := "Result"
		end

end
