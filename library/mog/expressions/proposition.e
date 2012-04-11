note
	description: "A proposition in a quantification."
	author: ""
	date: "$Date: 2005/05/02 22:58:31 $"
	revision: "$Revision: 1.1 $"

class
	PROPOSITION

inherit
	BOOLEAN_EXPRESSION

feature -- Access

	hash_code: INTEGER
		do
			check false end
		end

end -- class PROPOSITION
