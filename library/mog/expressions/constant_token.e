note
	description: "A constant for which the presence token itself has concrete semantics, e.g. Result, Current, Void."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CONSTANT_TOKEN

inherit
	CONSTANT

feature -- Access
	hash_code: INTEGER
		do
			Result := my_string_representation.hash_code
		end

	string_representation: STRING
			-- What is the string representation of `Current'?
		do
			Result := my_string_representation.twin
		end

feature {NONE} -- Implementation
	my_string_representation: STRING

invariant
	my_string_representation /= Void and then not my_string_representation.is_empty

end
