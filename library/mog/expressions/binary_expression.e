note
   description: "A binary expression."

class
   BINARY_EXPRESSION

inherit
   OPERATOR_EXPRESSION

feature -- Access

	hash_code: INTEGER
		do
			check false end
		end

end -- class BINARY_EXPRESSION
