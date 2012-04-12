note
   description: "A list of identifiers that are members of a set."

class
   MEMBER_RANGE

inherit
   VARIABLE_RANGE

create
	make

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

feature -- Access

	set_expression: SET_EXPRESSION
			-- What is the set expression of `Current'?
		do
			Result := my_set_expression.twin
		end


feature -- Implementation

	my_set_expression: SET_EXPRESSION

invariant
	my_set_expression /= Void

end -- class MEMBER_RANGE
