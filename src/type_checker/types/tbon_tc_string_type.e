note
	description: "A string type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_STRING_TYPE

inherit
	TBON_TC_CLASS_TYPE
		redefine
			conforms_to,
			is_model_equal
		end

create
	make_default_type

feature -- Initialization
	make_default_type
			-- Create an string type for type checking.
		do
			make (string_type_name)
		end

feature -- Status report
	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		do
			Result := False
		end

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_STRING_TYPE} other or Precursor {TBON_TC_CLASS_TYPE} (other)
		end

end
