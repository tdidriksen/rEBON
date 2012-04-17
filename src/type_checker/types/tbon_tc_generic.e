note
	description: "A generic type."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_GENERIC

inherit
	MML_MODEL
		redefine
			is_model_equal
		end

create
	make

feature -- Initialization
	make (a_formal_generic_name: STRING; an_actual_generic_type: like actual_generic_type)
			-- Initialize `Current'.
		require
			a_formal_generic_name /= Void
		do
			formal_generic_name := a_formal_generic_name.string
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

	is_model_equal alias "|=|" (other: TBON_TC_GENERIC): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := formal_generic_name ~ other.formal_generic_name and actual_generic_type ~ other.actual_generic_type
		end

invariant
	formal_generic_name /= Void

end
