note
	description: "An integer constant."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT

inherit
	MANIFEST_CONSTANT

create
	make

feature -- Initialization
	make (a_value: like value)
		do
			my_value := a_value.twin
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_value.hash_code
		end

	value: INTEGER
			-- What is the value of `Current'?
		do
			Result := my_value.twin
		end

feature {NONE} -- Implementation
	my_value: INTEGER

end
