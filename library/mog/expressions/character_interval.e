note
   description: "A finite, sequential list of characters."

class
   CHARACTER_INTERVAL

inherit
	BON_INTERVAL

create
	make

feature -- Initialization
	make (a_lower_bound, an_upper_bound: CHARACTER)
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

	lower_bound: CHARACTER
			-- What is the lower bound of `Current'?
		do
			Result := my_lower_bound.twin
		end

	upper_bound: CHARACTER
			-- What is the upper bound of `Current'?
		do
			Result := my_upper_bound.twin
		end

feature {NONE} -- Implementation

	my_lower_bound: CHARACTER
	my_upper_bound: CHARACTER

invariant
	my_lower_bound <= my_upper_bound

end -- class CHARACTER_INTERVAL
