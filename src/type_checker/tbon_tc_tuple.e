note
	description: "A tuple type."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TUPLE [G, H]

create
	make

feature -- Initialization
	make (first_item: G; second_item: H)
			-- Initialize `Current'.
		do
			first := first_item
			second := second_item
		end

feature -- Access
	first: G
			-- What is the first item of `Current'?

	second: H
			-- What is the second item of `Current'?

feature -- Element change
	set_first (new_first: G)
			-- Set first item of `Current' to `new_first'.
		do
			first := new_first
		end

	set_second (new_second: H)
			-- Set second item of `Current' to `new_second'.
		do
			second := new_second
		end

end
