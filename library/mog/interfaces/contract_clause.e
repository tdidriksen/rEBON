note
	description: "A contract clause for a feature."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTRACT_CLAUSE

create
	make

feature -- Initialization
	make (a_precondition, a_postcondition: ASSERTION_CLAUSE_LIST)
			-- Initialize `Current'.
		do
			if a_precondition /= Void then
				my_precondition := a_precondition.twin
			end

			if a_postcondition /= Void then
				my_postcondition := a_postcondition.twin
			end
		end

feature -- Access
	precondition: ASSERTION_CLAUSE_LIST
			-- What is the precondition of `Current'?
		do
			Result := my_precondition.twin
		end

	postcondition: ASSERTION_CLAUSE_LIST
			-- What is the postcondition of `Current'?
		do
			Result := my_postcondition.twin
		end

feature -- Status report
	has_precondition: BOOLEAN
			-- Does `Current' have a precondition?
		do
			Result := my_precondition /= Void and then not my_precondition.is_empty
		end

	has_postcondition: BOOLEAN
			-- Does `Current' have a postcondition?
		do
			Result := my_postcondition /= Void and then not my_postcondition.is_empty
		end

feature -- Implementation

	my_precondition: ASSERTION_CLAUSE_LIST
	my_postcondition: ASSERTION_CLAUSE_LIST

invariant


end
