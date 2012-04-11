note
	description: "An integer type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_INTEGER_TYPE

inherit
	TBON_TC_DEFAULT_VALUE_TYPE

create
	make

feature -- Initialization
	make
			-- Create an integer type for type checking.
		do
			name := integer_type_name
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
			Result := attached {TBON_TC_INTEGER_TYPE} other
		end

end
