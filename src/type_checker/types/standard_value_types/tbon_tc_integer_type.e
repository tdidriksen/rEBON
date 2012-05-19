note
	description: "An integer type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_INTEGER_TYPE

inherit
	TBON_TC_REAL_TYPE
		redefine
			make_default_type,
			initialize_features,
			initialize_binary_operators,
			is_model_equal
		end


create
	make_default_type

feature -- Initialization
	make_default_type
			-- Create an integer type for type checking.
		do
			make (integer_type_name)
			initialize_features
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_INTEGER_TYPE} other
		end


feature {NONE} -- Implementation

	initialize_features
			-- Initialize features of type.
		do
			initialize_unary_operators
			initialize_binary_operators
		end

	initialize_binary_operators
			-- Initialize binary operators.
			-- Integers have the following binary operators:
			-- +, -, *, /, <, >, <=, >=, = , /=, //, \\, ^
		local
			l_feature: TBON_TC_FEATURE
			l_argument: TBON_TC_FEATURE_ARGUMENT
			real_type: TBON_TC_REAL_TYPE
		do
			Precursor

			create real_type.make_default_type

			-- Create as_real
			create l_feature.make ("as_real", real_type, Current)
			add_feature (l_feature)

		end

end
