note
	description: "A tuple type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TUPLE_TYPE

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
		local
			l_feature: TBON_TC_FEATURE
			l_generic: TBON_TC_GENERIC
		do
			make (tuple_type_name)

			create l_generic.make ("G", Void, Current)
			add_type_parameter (l_generic)

			create l_generic.make ("H", Void, Current)
			add_type_parameter (l_generic)
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_TUPLE_TYPE} other
		end

end
