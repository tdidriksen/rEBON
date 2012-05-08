note
	description: "A sign for a number."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SIGN

inherit
	UNARY_OPERATOR
		redefine
			make_plus,
			make_minus,
			is_plus,
			is_minus
		end

	BINARY_OPERATOR
		redefine
			make_plus,
			make_minus,
			is_plus,
			is_minus
		end

create
	make_plus, make_minus

feature -- Initialization
	make_plus
			-- Initialize `Current' as a plus operator.
		do
			is_plus := True
			my_string_representation := "+"
			set_unary
		end

	make_minus
			-- Initialize `Current' as a minus operator.
		do
			is_minus := True
			my_string_representation := "-"
			set_unary
		end

feature -- Access

	is_plus: BOOLEAN
			-- Is `Current' a plus operator?

	is_minus: BOOLEAN
			-- Is `Current' a minus operator?

end
