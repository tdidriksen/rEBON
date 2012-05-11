note
	description: "A boolean type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_BOOLEAN_TYPE

inherit
	TBON_TC_CLASS_TYPE
		redefine
			is_model_equal
		end

create
	make_default_type

feature -- Initialization
	make_default_type
			-- Create a boolean type for type checking.
		do
			make (boolean_type_name)
			initialize_features
		end

feature -- Status report

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := attached {TBON_TC_BOOLEAN_TYPE} other or Precursor {TBON_TC_CLASS_TYPE} (other)
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
			-- Booleans have the following unary operators:
			-- 'not'
		local
			l_feature: TBON_TC_FEATURE
			l_argument: TBON_TC_FEATURE_ARGUMENT
		do
			-- Create not
			create l_feature.make ("not", Current, Current)
			l_feature.set_is_prefix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
		end

	initialize_binary_operators
			-- Initialize binary operators.
			-- Booleans have the following binary operators:
			-- 'and', 'or', 'xor', ->, <->, =, /=
		local
			l_feature: TBON_TC_FEATURE
			l_argument: TBON_TC_FEATURE_ARGUMENT
		do
			-- Create and
			create l_feature.make ("and", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create or
			create l_feature.make ("or", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create xor
			create l_feature.make ("xor", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create implication
			create l_feature.make ("->", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create logical equivalence
			create l_feature.make ("<->", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create equals
			create l_feature.make ("=", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)

			-- Create not equals
			create l_feature.make ("/=", Current, Current)
			l_feature.set_is_infix
			create l_argument.make ("a_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
			create l_argument.make ("another_boolean", Current, l_feature)
			l_feature.arguments.extend (l_argument)
		end

end
