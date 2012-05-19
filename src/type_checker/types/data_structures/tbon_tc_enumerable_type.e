note
	description: "An enumerable type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_ENUMERABLE_TYPE

inherit
	TBON_TC_CLASS_TYPE
		redefine
			is_model_equal
		end


create
	make_default_type

feature -- Initialization
	make_default_type
			-- Create an integer type for type checking.
		do
			make (enumerable_type_name)
			set_is_deferred
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_ENUMERABLE_TYPE} other
		end

end
