note
	description: "A list type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_LIST_TYPE

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
		do
			make (list_type_name)

			create int_type.make_default_type

			create l_generic.make ("E", Void, Current)
			add_type_parameter (l_generic)

			create l_feature.make ("i_th", create {TBON_TC_CLASS_TYPE}.make ("E"), Current)
			create l_argument.make ("index", int_type, l_feature)
			l_feature.arguments.extend (l_argument)
			add_feature (l_feature)
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_LIST_TYPE} other
		end

end
