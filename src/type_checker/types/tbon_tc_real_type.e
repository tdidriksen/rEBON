note
	description: "A real type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_REAL_TYPE

inherit
	TBON_TC_CLASS_TYPE
		redefine
			is_model_equal
		end

create
	make_default_type

feature -- Initialization
	make_default_type
			-- Create a real type for type checking.
		do
			make (real_type_name)
			initialize_features
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_REAL_TYPE} other or Precursor {TBON_TC_CLASS_TYPE} (other)
		end

feature {NONE} -- Implementation

	initialize_features
			-- Initialize features of type.
		do
			initialize_unary_operators
			initialize_binary_operators
		end

	initialize_unary_operators
			-- Initialize unary operators.
			-- Reals have the following unary operators:
			-- +, -
		local
			l_feature: TBON_TC_FEATURE
			l_argument: TBON_TC_FEATURE_ARGUMENT
		do
			create l_feature.make ("+", Current, Current)
			l_feature.set_is_prefix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			create l_feature.make ("-", Current, Current)
			l_feature.set_is_prefix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
		end

	initialize_binary_operators
			-- Initialize binary operators.
			-- Reals have the following binary operators:
			-- +, -, *, /, <, >, <=, >=, = , /=, //, \\, ^
		local
			l_feature: TBON_TC_FEATURE
			l_argument: TBON_TC_FEATURE_ARGUMENT
			boolean_type: TBON_TC_BOOLEAN_TYPE
		do
			create boolean_type.make_default_type

			-- Create plus
			create l_feature.make ("+", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create minus
			create l_feature.make ("-", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create times
			create l_feature.make ("*", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create division
			create l_feature.make ("/", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create less-than
			create l_feature.make ("<", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create greater-than
			create l_feature.make (">", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create less-than-equals
			create l_feature.make ("<=", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create greater-than-equals
			create l_feature.make (">=", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create equals
			create l_feature.make ("=", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create not equals
			create l_feature.make ("/=", boolean_type, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)


			-- Create real division
			create l_feature.make ("//", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create modulo
			create l_feature.make ("\\", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create power
			create l_feature.make ("^", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("an_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_real", Current, l_feature)
			l_feature.arguments.extend (l_argument)
		end

end
