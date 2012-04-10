note
	description: "Objects that ..."
	author: "Joseph R. Kiniry <kiniry@kindsoftware.com>"
	date: "$Date: 2005/05/02 22:58:30 $"
	revision: "$Revision: 1.1 $"

class
	PARENT_INDIRECTION

inherit
	GENERIC_INDIRECTION
		redefine
			BON_OUT
		end

creation
	make

feature -- Initialization

	make (a_generic_indirection: GENERIC_INDIRECTION)
			-- Initialize `Current' from the given generic indirection.
		do
			if a_generic_indirection.formal_generic_name /= Void then
				my_formal_generic_name := a_generic_indirection.formal_generic_name
			end
			if a_generic_indirection.named_indirection /= Void then
				my_named_indirection := a_generic_indirection.named_indirection
			end
		ensure
			my_named_indirection /= Void xor my_formal_generic_name /= Void
		end

feature -- Output

	bon_out: STRING
		do
			Result := "-> "
			Result.append (Precursor)
		end

end -- class PARENT_INDIRECTION
