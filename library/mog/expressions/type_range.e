note
   description: "A list of identifiers and their type."

class
   TYPE_RANGE

inherit
   VARIABLE_RANGE

create
	make

feature -- Initialization
	make (some_identifiers: STRING_LIST; a_type: BON_TYPE)
			-- Initialize `Current'.
		require
			some_identifiers /= Void and then not some_identifiers.is_empty
			a_type /= Void
		do
			my_identifiers := some_identifiers.twin
			my_type := a_type.twin
		ensure
			equal (identifiers, some_identifiers)
			equal (type, a_type)
		end

feature -- Access

	type: BON_TYPE
			-- What is the type of `Current'?
		do
			Result := my_type.twin
		end


feature {NONE} -- Implementation

	my_type: BON_TYPE

invariant
	my_type /= Void

end -- class TYPE_RANGE
