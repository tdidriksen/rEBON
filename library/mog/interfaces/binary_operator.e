note
	description: "A binary operator."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BINARY_OPERATOR

inherit
	OPERATOR

create
	make_plus, make_minus, make_times, make_division, make_less_than,
	make_greater_than, make_less_than_equals, make_greater_than_equals,
	make_equals, make_not_equals, make_modulo, make_integer_division,
	make_power, make_or, make_xor, make_and, make_implies, make_logical_equivalence,
	make_member_of, make_colon

feature -- Initialization
	make_plus
			-- Initialize `Current' as a plus operator.
		do
			is_plus := True
			is_binary := True
			my_string_representation := "+"
		end

	make_minus
			-- Initialize `Current' as a minus operator.
		do
			is_minus := True
			is_binary := True
			my_string_representation := "-"
		end

	make_times
			-- Initialize `Current' as a times operator.
		do
			is_times := True
			is_binary := True
			my_string_representation := "*"
		end

	make_division
			-- Initialize `Current' as a division operator.
		do
			is_division := True
			is_binary := True
			my_string_representation := "/"
		end

	make_less_than
			-- Initialize `Current' as a less-than operator.
		do
			is_less_than := True
			is_binary := True
			my_string_representation := "<"
		end

	make_greater_than
			-- Initialize `Current' as a greather-than operator.
		do
			is_greater_than := True
			is_binary := True
			my_string_representation := ">"
		end

	make_less_than_equals
			-- Initialize `Current' as a less-than-equals operator.
		do
			is_less_than_equals := True
			is_binary := True
			my_string_representation := "<="
		end

	make_greater_than_equals
			-- Initialize `Current' as a greater-than-equals operator.
		do
			is_greater_than_equals := True
			is_binary := True
			my_string_representation := ">="
		end

	make_equals
			-- Initialize `Current' as an equals operator.
		do
			is_equals := True
			is_binary := True
			my_string_representation := "="
		end

	make_not_equals
			-- Initialize `Current' as a not-equals operator.
		do
			is_not_equals := True
			is_binary := True
			my_string_representation := "/="
		end

	make_integer_division
			-- Initialize `Current' as an integer division operator.
		do
			is_integer_division := True
			is_binary := True
			my_string_representation := "//"
		end

	make_modulo
			-- Initialize `Current' as a modulo operator.
		do
			is_modulo := True
			is_binary := True
			my_string_representation := "\\"
		end

	make_power
			-- Initialize `Current' as a power operator.
		do
			is_power := True
			is_binary := True
			my_string_representation := "^"
		end

	make_or
			-- Initialize `Current' as an or operator.
		do
			is_or := True
			is_binary := True
			my_string_representation := "or"
		end

	make_xor
			-- Initialize `Current' as a exclusive-or operator.
		do
			is_xor := True
			is_binary := True
			my_string_representation := "xor"
		end

	make_and
			-- Initialize `Current' as an and operator.
		do
			is_and := True
			is_binary := True
			my_string_representation := "and"
		end

	make_implies
			-- Initialize `Current' as an implies operator.
		do
			is_implies := True
			is_binary := True
			my_string_representation := "->"
		end

	make_logical_equivalence
			-- Initialize `Current' as a logical equivalence operator.
		do
			is_logical_equivalence := True
			is_binary := True
			my_string_representation := "<->"
		end

	make_member_of
			-- Initialize `Current' as a set membership operator.
		do
			is_member_of := True
			is_binary := True
			my_string_representation := "member_of"
		end

	make_colon
			-- Initialize `Current' as a colon operator.
		do
			is_colon := True
			is_binary := True
			my_string_representation := ":"
		end


feature -- Access

	is_plus: BOOLEAN
			-- Is `Current' a plus operator?

	is_minus: BOOLEAN
			-- Is `Current' a minus operator?

	is_times: BOOLEAN
			-- Is `Current' a times operator?

	is_division: BOOLEAN
			-- Is `Current' a division operator?

	is_less_than: BOOLEAN
			-- Is `Current' a less-than operator?

	is_greater_than: BOOLEAN
			-- Is `Current' a greater-than operator?

	is_less_than_equals: BOOLEAN
			-- Is `Current' a less-than-equals operator?

	is_greater_than_equals: BOOLEAN
			-- Is `Current' a greater-than-equals operator?

	is_equals: BOOLEAN
			-- Is `Current' an equals operator?

	is_not_equals: BOOLEAN
			-- Is `Current' a not-equals operator?

	is_modulo: BOOLEAN
			-- Is `Current' a modulo operator?

	is_integer_division: BOOLEAN
			-- Is `Current' a integer division operator?

	is_power: BOOLEAN
			-- Is `Current' a power operator?

	is_or: BOOLEAN
			-- Is `Current' an or operator?

	is_xor: BOOLEAN
			-- Is `Current' an exclusive-or operator?

	is_and: BOOLEAN
			-- Is `Current' an and operator?

	is_implies: BOOLEAN
			-- Is `Current' an implies operator?

	is_logical_equivalence: BOOLEAN
			-- Is `Current' a logical equivalence operator?

	is_member_of: BOOLEAN
			-- Is `Current' a set membership operator?

	is_colon: BOOLEAN
			-- Is `Current' a colon operator?

invariant
	is_plus xor is_minus xor is_times xor is_division xor is_less_than xor is_greater_than xor
	is_greater_than_equals xor is_less_than_equals xor is_equals xor is_not_equals xor is_modulo xor
	is_integer_division xor is_power xor is_or xor is_xor xor is_and xor is_implies xor is_logical_equivalence xor
	is_member_of xor is_colon

	my_string_representation /= Void

end
