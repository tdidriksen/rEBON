note
	description: "A table type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TABLE_TYPE

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
			l_argument: TBON_TC_FEATURE_ARGUMENT
			int_type: TBON_TC_INTEGER_TYPE
			set_type: TBON_TC_SET_TYPE
			other_set_type: TBON_TC_SET_TYPE
		do
			make (table_type_name)

			create int_type.make_default_type
			create set_type.make_default_type
			create other_set_type.make_default_type

			create l_generic.make ("K", Void, Current)
			add_type_parameter (l_generic)

			create l_generic.make ("V", Void, Current)
			add_type_parameter (l_generic)

			set_type.generics[1].set_actual_type (create {TBON_TC_CLASS_TYPE}.make ("K"))
			create l_feature.make ("keys", set_type, Current)
			add_feature (l_feature)

			other_set_type.generics[1].set_actual_type (create {TBON_TC_CLASS_TYPE}.make ("V"))
			create l_feature.make ("values", other_set_type, Current)
			add_feature (l_feature)
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_TABLE_TYPE} other
		end

end
