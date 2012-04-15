note
   description: "A constant whose type is a basic type (boolean, character %
               % integer, real, or string)."

deferred class
   MANIFEST_CONSTANT

inherit
	CONSTANT

feature -- Initialization
	make (a_value: like value)
			-- Initialize `Current'.
		deferred
		ensure
			equal (value, a_value)
		end

feature -- Access
	value: ANY
			-- What is the value of `Current'?
		deferred
		end

invariant
	value /= Void

end -- class MANIFEST_CONSTANT
