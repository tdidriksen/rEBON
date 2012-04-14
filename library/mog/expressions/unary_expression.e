note
   description: "An unary expression."

class
   UNARY_EXPRESSION

inherit
   OPERATOR_EXPRESSION

create
	make

feature -- Initialization
	make (an_operator: OPERATOR; an_expression: BOOLEAN_EXPRESSION)
			-- Initialize `Current'.
		require
			an_operator /= Void
			an_expression /= Void
		do
			my_operator := an_operator.twin
			my_expression := an_expression.twin
		ensure
			equal (operator, an_operator)
			equal (expression, an_expression)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_operator.hash_code + my_expression.hash_code
		end

	operator: OPERATOR
			-- What is the operator of `Current'?
		do
			Result := my_operator.twin
		end

	expression: BOOLEAN_EXPRESSION
			-- What is the expression of `Current'?
		do
			Result := my_expression.twin
		end

feature {NONE} -- Implementation
	my_operator: OPERATOR
	my_expression: BOOLEAN_EXPRESSION

invariant
	my_operator /= Void
	my_expression /= Void

end -- class UNARY_EXPRESSION
