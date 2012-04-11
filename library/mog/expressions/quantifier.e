note
	description: "A quantifier in a boolean expression."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUANTIFIER

create
	make_for_all, make_exists

feature -- Initialization
	make_for_all
			-- Initialize `Current' as a universal quantifier.
		do
			is_for_all := True
			my_string_representation := "for_all"
		ensure
			is_for_all
			not is_exists
			string_representation.is_equal ("for_all")
		end

	make_exists
			-- Initialize `Current' as a existential quantifier.
		do
			is_exists := True
			my_string_representation := "exists"
		ensure
			is_exists
			not is_for_all
			string_representation.is_equal ("exists")
		end

feature -- Access
	string_representation: STRING
			-- What is the string representation of `Current'?
		do
			Result := my_string_representation.twin
		end

feature -- Status report
	is_for_all: BOOLEAN
			-- Is `Current' a universal quantifier?

	is_exists: BOOLEAN
			-- Is `Current' an existential quantifier?

feature -- Implementation
	my_string_representation: STRING

invariant
	is_for_all xor is_exists
	my_string_representation /= Void and then not my_string_representation.is_empty

end
