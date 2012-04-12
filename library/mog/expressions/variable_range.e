note
   description: "A range of identifiers, either from a set or of %
               % a particular type."

deferred class
  VARIABLE_RANGE

inherit
	HASHABLE

feature -- Access

	hash_code: INTEGER
		do
			Result := 0
			from
				my_identifiers.start
			until
				my_identifiers.after
			loop
				Result := Result + my_identifiers.item_for_iteration.hash_code

				my_identifiers.forth
			end
		end

	identifiers: STRING_LIST
			-- What are the identifiers of `Current'?
		do
			Result := my_identifiers.twin
		end


feature -- Implementation

	my_identifiers: STRING_LIST

invariant
	my_identifiers /= Void and then not my_identifiers.is_empty
	my_identifiers.for_all (agent (id: STRING): BOOLEAN do Result := not id.is_empty end)

end -- class VARIABLE_RANGE
