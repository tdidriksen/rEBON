note
	description: "A generic type."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_GENERIC

create
	make

feature -- Initialization
	make (a_formal_generic_name: STRING; an_actual_generic_type: like actual_generic_type)
			-- Initialize `Current'.
		do
			formal_generic_name := a_formal_generic_name
			actual_generic_type := an_actual_generic_type
		end

feature -- Access
	formal_generic_name: STRING
			-- What is the formal generic name of `Current'?

	actual_generic_type: TBON_TC_CLASS_TYPE
			-- What is the actual generic name of `Current'?

feature -- Status report
	has_actual_generic_type: BOOLEAN
			-- Does `Current' have an actual generic?
		do
			Result := actual_generic_type /= Void
		end

invariant
	formal_generic_name /= Void

end
