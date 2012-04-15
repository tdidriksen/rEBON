note
   description: "A list of identifiers that are members of a set."

class
   MEMBER_RANGE

inherit
   VARIABLE_RANGE

create
	make, make_with_parenthesized_expression

feature -- Initialization
	make (some_identifiers: STRING_LIST; a_set_expression: SET_EXPRESSION)
			-- Initialize `Current'.
		require
			some_identifiers /= Void and then not some_identifiers.is_empty
			a_set_expression /= Void
		do
			my_identifiers := some_identifiers.twin
			my_set_expression := a_set_expression.twin
		ensure
			equal (identifiers, some_identifiers)
			equal (set_expression, a_set_expression)
		end

	make_with_parenthesized_expression (some_identifiers: STRING_LIST; a_boolean_expression: BOOLEAN_EXPRESSION)
			-- Initialize `Current' with a parenthesized expression.
		require
			some_identifiers /= Void and then not some_identifiers.is_empty
			a_boolean_expression /= Void
		do
			my_identifiers := some_identifiers.twin
			my_boolean_expression := a_boolean_expression.twin
		ensure
			equal (identifiers, some_identifiers)
			equal (boolean_expression, a_boolean_expression)
		end

feature -- Access

	set_expression: SET_EXPRESSION
			-- What is the set expression of `Current'?
		do
			Result := my_set_expression.twin
		end

	boolean_expression: BOOLEAN_EXPRESSION
			-- What is the boolean expression of `Current'?
		do
			Result := my_boolean_expression.twin
		end

feature -- Status report

	has_set_expression: BOOLEAN
			-- Does `Current' have a set_expression?
		do
			Result := my_set_expression /= Void
		end

	has_boolean_expression: BOOLEAN
			-- Does `Current' have a boolean_expression?
		do
			Result := my_boolean_expression /= Void
		end


feature {NONE} -- Implementation

	my_set_expression: SET_EXPRESSION
	my_boolean_expression: BOOLEAN_EXPRESSION

invariant
	my_set_expression /= Void xor my_boolean_expression /= Void

end -- class MEMBER_RANGE
