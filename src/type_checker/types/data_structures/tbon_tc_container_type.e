note
	description: "An container type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_CONTAINER_TYPE

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
			generic: TBON_TC_GENERIC
			l_feature: TBON_TC_FEATURE
			int_type: TBON_TC_INTEGER_TYPE
		do
			make (enumerable_type_name)
			set_is_deferred

			create generic.make ("E", Void, Current)
			add_type_parameter (generic)

			create int_type.default_create
			create l_feature.make ("count", int_type, Current)
			add_feature (l_feature)
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_ENUMERABLE_TYPE} other
		end

end
