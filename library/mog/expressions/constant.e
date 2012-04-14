note
   description: "A constant expression."

class
   CONSTANT

inherit
   BOOLEAN_EXPRESSION
   	redefine
   		hash_code
    end

feature -- Access

	hash_code: INTEGER
		do
			check false end
		end

end -- class CONSTANT
