note
	description: "A generic type."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_GENERIC

inherit
	MML_MODEL
		redefine
			is_model_equal,
			is_equal
		end

create
	make

feature -- Initialization
	make (a_formal_generic_name: like formal_generic_name; a_bounding_type: like bounding_type)
			-- Initialize `Current'.
		require
			a_formal_generic_name /= Void
		do
			formal_generic_name := a_formal_generic_name.string
			bounding_type := a_bounding_type
		end

feature -- Access
	formal_generic_name: STRING
			-- What is the formal generic name of `Current'?

	actual_type: TBON_TC_CLASS_TYPE
			-- What is the actual type of `Current'?

	bounding_type: TBON_TC_CLASS_TYPE
			-- What is the bounding type of `Current'?

feature -- Status report
	has_actual_type: BOOLEAN
			-- Does `Current' have an actual generic type?
		do
			Result := actual_type /= Void
		end

	has_bounding_type: BOOLEAN
			-- Does `Current' have a bounding generic?
		do
			Result := bounding_type /= Void
		end

	is_equal (other: like Current): BOOLEAN
		do
			Result := is_model_equal (other)
		end

	is_model_equal alias "|=|" (other: TBON_TC_GENERIC): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := formal_generic_name ~ other.formal_generic_name and bounding_type ~ other.bounding_type

		end

	is_valid_actual_type (an_actual_type: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Is  `an_actual_type' valid according to the bounding type of `Current'?
		do
			Result := True
			if bounding_type /= Void then
				Result := an_actual_type.conforms_to (bounding_type)
			end
		end

feature -- Element change
	set_actual_type (an_actual_type: TBON_TC_CLASS_TYPE)
			-- Set `actual_type' to `an_actual_type'?
		do
			actual_type := an_actual_type
		end

	set_bounding_type (a_class_type: TBON_TC_CLASS_TYPE)
			-- Set `bounding_type' to `a_class_type'?
		do
			bounding_type := a_class_type
		end

invariant
	formal_generic_name /= Void
	--actual_type /= Void implies is_valid_actual_type (actual_type)

end
