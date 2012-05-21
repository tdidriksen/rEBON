note
   description: "A call chain representing a feature invocation."

class
   CALL

inherit
   BOOLEAN_EXPRESSION

   SET_EXPRESSION

create
	make

feature -- Initialization
	make (a_parenthesized_qualifier: BOOLEAN_EXPRESSION; a_call_chain: UNQUALIFIED_CALLS)
			-- Initialize `Current'.
		require
			a_call_chain /= Void and then not a_call_chain.is_empty
		do
			my_call_chain := a_call_chain.twin
			if a_parenthesized_qualifier /= Void then
				my_parenthesized_qualifier := a_parenthesized_qualifier.twin
			end
		ensure
			a_parenthesized_qualifier /= Void implies equal (parenthesized_qualifier, a_parenthesized_qualifier)
			equal (call_chain, a_call_chain)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := 0
			from
				my_call_chain.start
			until
				my_call_chain.after
			loop
				Result := Result + my_call_chain.item_for_iteration.hash_code
				my_call_chain.forth
			end
		end

	parenthesized_qualifier: BOOLEAN_EXPRESSION
			-- What is the parenthesized qualifier of `Current'?
		do
			Result := my_parenthesized_qualifier.twin
		end

	call_chain: UNQUALIFIED_CALLS
			-- What is the call chain of `Current'?
		do
			Result := my_call_chain.twin
		end

feature -- Status report
	has_parenthesized_qualifier: BOOLEAN
			-- Does `Current' have a parenthesized qualifier?
		do
			Result := my_parenthesized_qualifier  /= Void and then my_call_chain.is_empty
		end

feature {NONE} -- Implementation
	my_parenthesized_qualifier: BOOLEAN_EXPRESSION
	my_call_chain: UNQUALIFIED_CALLS

invariant
	my_call_chain /= Void and then not my_call_chain.is_empty

end -- class CALL
