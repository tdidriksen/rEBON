note
	description: "A finite, sequential list of integers."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BON_INTEGER_INTERVAL

inherit
	BON_INTERVAL

create
	make

feature -- Initialization
	make (a_lower_bound, an_upper_bound: INTEGER)
			-- Initialize `Current'.
		require
			a_lower_bound <= an_upper_bound
		do
			my_lower_bound := a_lower_bound.twin
			my_upper_bound := an_upper_bound.twin
		ensure
			lower_bound.is_equal (a_lower_bound)
			upper_bound.is_equal (an_upper_bound)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_lower_bound.hash_code + my_upper_bound.hash_code
		end

	lower_bound: INTEGER
			-- What is the lower bound of `Current'?
		do
			Result := my_lower_bound.twin
		end

	upper_bound: INTEGER
			-- What is the upper bound of `Current'?
		do
			Result := my_upper_bound.twin
		end

feature {NONE} -- Implementation

	my_lower_bound: INTEGER
	my_upper_bound: INTEGER

invariant
	my_lower_bound <= my_upper_bound

end
