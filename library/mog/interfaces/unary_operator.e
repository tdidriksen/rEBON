note
	description: "A unary operator."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNARY_OPERATOR

inherit
	OPERATOR

create
	make_delta, make_old, make_not, make_plus, make_minus

feature -- Initialization
	make_delta
			-- Initialize `Current' as a delta operator.
		do
			is_delta := True
			is_unary := True
			my_string_representation := "delta"
		end

	make_old
			-- Initialize `Current' as an old operator.
		do
			is_old := True
			is_unary := True
			my_string_representation := "old"
		end

	make_not
			-- Initialize `Current' as a not operator.
		do
			is_not := True
			is_unary := True
			my_string_representation := "not"
		end

	make_plus
			-- Initialize `Current' as a plus operator.
		do
			is_plus := True
			is_unary := True
			my_string_representation := "+"
		end

	make_minus
			-- Initialize `Current' as a minus operator.
		do
			is_minus := True
			is_unary := True
			my_string_representation := "-"
		end

feature -- Access

	is_delta: BOOLEAN
			-- Is `Current' a delta operator?

	is_old: BOOLEAN
			-- Is `Current' an old operator?

	is_not: BOOLEAN
			-- Is `Current' a not operator?

	is_plus: BOOLEAN
			-- Is `Current' a plus operator?

	is_minus: BOOLEAN
			-- Is `Current' a minus operator?

invariant
	is_delta xor is_old xor is_not xor is_plus xor is_minus
	my_string_representation /= Void

end
