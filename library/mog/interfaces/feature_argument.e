note
	description: "A feature argument"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEATURE_ARGUMENT

inherit
	HASHABLE

create
	make

feature -- Initialization
	make (some_identifiers: STRING_LIST; a_type: BON_TYPE)
			-- Initialize `Current'.
		require
			a_type /= Void
		do
			my_type := a_type.twin

			if some_identifiers /= Void then
				my_identifiers := some_identifiers.twin
			end
		ensure
			equal (a_type, type)
			some_identifiers /= Void implies equal (some_identifiers, identifiers)
		end


feature -- Access

	identifiers: STRING_LIST
			-- What are the identifiers of `Current'?
		do
			Result := my_identifiers.twin
		end

	type: BON_TYPE
			-- What is the type of `Current'?
		do
			Result := my_type.twin
		end

	hash_code: INTEGER
		do
			Result := type.hash_code
		end


feature {NONE} -- Implementation

	my_identifiers: STRING_LIST
	my_type: BON_TYPE

invariant
	my_type /= Void
	my_identifiers /= Void implies (not my_identifiers.is_empty and my_identifiers.for_all (agent (s: STRING): BOOLEAN do Result := not s.is_empty end))


end
