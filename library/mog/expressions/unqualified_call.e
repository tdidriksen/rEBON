note
	description: "An unqualified call."
	author: ""
	date: "$Date: 2005/05/02 22:58:31 $"
	revision: "$Revision: 1.1 $"

class
	UNQUALIFIED_CALL

inherit
	HASHABLE

create
	make

feature -- Initialization
	make (an_identifier: STRING; some_actual_arguments: EXPRESSION_LIST)
			-- Initialize `Current'.
		require
			an_identifier /= Void and then not an_identifier.is_empty
		do
			my_identifier := an_identifier.twin
			if some_actual_arguments /= Void then
				my_actual_arguments := some_actual_arguments.twin
			end
		ensure
			equal (identifier, an_identifier)
			some_actual_arguments /= Void implies equal (actual_arguments, some_actual_arguments)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := my_identifier.hash_code
		end

	identifier: STRING
			-- What is the identifier of `Current'?
		do
			Result := my_identifier.twin
		end

	actual_arguments: EXPRESSION_LIST
			-- What are the actual arguments of `Current'?
		do
			Result := my_actual_arguments.twin
		end

feature -- Status report
	has_actual_arguments: BOOLEAN
		do
			Result := my_actual_arguments /= Void
		end

feature {NONE} -- Implementation
	my_identifier: STRING
	my_actual_arguments: EXPRESSION_LIST

invariant
	my_identifier /= Void and then not my_identifier.is_empty
	my_actual_arguments /= Void implies not my_actual_arguments.is_empty

end -- class UNQUALIFIED_CALL
