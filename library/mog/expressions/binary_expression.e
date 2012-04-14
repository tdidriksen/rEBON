note
   description: "A binary expression."

class
   BINARY_EXPRESSION

inherit
   OPERATOR_EXPRESSION

create
	make

feature -- Initialization
	make (an_operator: OPERATOR; a_left_expression, a_right_expression: BOOLEAN_EXPRESSION)
			-- Initialize `Current'.
		require
			an_operator /= Void
			a_left_expression /= Void
			a_right_expression /= Void
		do
			my_operator := an_operator.twin
			my_left_expression := a_left_expression.twin
			my_right_expression := a_right_expression.twin
		ensure
			equal (operator, an_operator)
			equal (left_expression, a_left_expression)
			equal (right_expression, a_right_expression)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_operator.hash_code + my_left_expression.hash_code + my_right_expression.hash_code
		end

	operator: OPERATOR
			-- What is the operator of `Current'?
		do
			Result := my_operator.twin
		end

	left_expression: BOOLEAN_EXPRESSION
			-- What is the left expression of `Current'?
		do
			Result := my_left_expression.twin
		end

	right_expression: BOOLEAN_EXPRESSION
			-- What is the right expression of `Current'?
		do
			Result := my_right_expression.twin
		end

feature {NONE} -- Implementation
	my_operator: OPERATOR
	my_left_expression: BOOLEAN_EXPRESSION
	my_right_expression: BOOLEAN_EXPRESSION

invariant
	my_operator /= Void
	my_left_expression /= Void
	my_right_expression /= Void

end -- class BINARY_EXPRESSION
