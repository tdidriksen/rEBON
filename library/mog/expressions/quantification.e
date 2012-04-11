note
   description: "A quantification expression."

class
   QUANTIFICATION

inherit
   BOOLEAN_EXPRESSION

create
	make

feature -- Initialization
	make (a_quantifier: QUANTIFIER;
			a_range_expression: VARIABLE_RANGE_LIST;
			a_restriction: BOOLEAN_EXPRESSION;
			a_proposition: BOOLEAN_EXPRESSION)
			-- Initialize `Current'.
		require
			a_quantifier /= Void
			a_range_expression /= Void
			a_proposition /= Void
		do
			my_quantifier := a_quantifier.twin
			my_range_expression := a_range_expression.twin

			if a_restriction /= Void then
				my_restriction := a_restriction.twin
			end

			my_proposition := a_proposition.twin
		ensure
			equal (quantifier, a_quantifier)
			equal (range_expression, a_range_expression)
			a_restriction /= Void implies equal (restriction, a_restriction)
			equal (proposition, a_proposition)
		end

feature -- Access

	hash_code: INTEGER
		do
			check false end
		end

	quantifier: QUANTIFIER
			-- What is the quantifier of `Current'?
		do
			Result := my_quantifier.twin
		end

	range_expression: VARIABLE_RANGE_LIST
			-- What is the range expression of `Current'?
		do
			Result := my_range_expression.twin
		end

	restriction: BOOLEAN_EXPRESSION
			-- What is the restriction of `Current'?
		do
			Result := my_restriction.twin
		end

	proposition: BOOLEAN_EXPRESSION
			-- What is the proposition of `Current'?
		do
			Result := my_proposition.twin
		end

feature -- Status report
	has_restriction: BOOLEAN
			-- Does `Current' have a restriction?
		do
			Result := my_restriction /= Void
		end

feature -- Implementation

	my_quantifier: QUANTIFIER
	my_range_expression: VARIABLE_RANGE_LIST
	my_restriction: BOOLEAN_EXPRESSION
	my_proposition: BOOLEAN_EXPRESSION

invariant
	my_quantifier /= Void
	my_range_expression /= Void
	my_proposition /= Void

end -- class QUANTIFICATION
