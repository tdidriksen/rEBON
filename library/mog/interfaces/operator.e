note
	description: "An operator."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATOR

create
	make_free_operator

feature --Initialization
	make_free_operator (an_operator: STRING)
			-- Initialize `Current' as a free operator?
		do
			is_free := True
			my_string_representation := an_operator.twin
		ensure
			string_representation.is_equal (an_operator)
		end

feature -- Access

	string_representation: STRING
			-- What is the string representation of `Current'?
		do
			Result := my_string_representation.twin
		end

	is_binary: BOOLEAN
			-- Is `Current' a binary operator?

	is_unary: BOOLEAN
			-- Is `Current' a unary operator?

	is_free: BOOLEAN
			-- Is `Current' a free operator?

feature -- Element change

	set_binary
			-- Set `Current' to be a binary operator?
		do
			is_free := False
			is_binary := True
			is_unary := False
		end

	set_unary
			-- Set `Current' to be a unary operator?
		do
			is_free := False
			is_binary := False
			is_unary := True
		end

feature {NONE} -- Implementation

	my_string_representation: STRING

invariant
	my_string_representation /= Void
	is_free xor is_binary xor is_unary

end
