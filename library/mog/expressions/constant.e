note
   description: "A constant expression."

class
   CONSTANT

inherit
   EXPRESSION
   	redefine
   		hash_code
    end

feature -- Access

	hash_code: INTEGER
		do
			check false end
		end

end -- class CONSTANT
