note
	description: "A feature argument - used for type checking of textual BON."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_FEATURE_ARGUMENT

inherit
	ANY
		redefine
			is_equal
		end

create
	make, make_with_formal_generic_name

feature -- Initialization
	make (a_formal_name: STRING; a_type: TBON_TC_CLASS_TYPE)
		require
			a_formal_name /= Void and then not a_formal_name.is_empty
			a_type /= Void
		do
			formal_name := a_formal_name.string
			type := a_type
			has_type := True
			has_formal_generic_name := False
		ensure
			formal_name.is_equal (a_formal_name)
			equal (type, a_type)
		end

	make_with_formal_generic_name (a_formal_name, a_formal_generic_name: STRING)
		require
			a_formal_name /= Void and then not a_formal_name.is_empty
			a_formal_generic_name /= Void and then not a_formal_generic_name.is_empty
		do
			formal_name := a_formal_name.string
			formal_generic_name := a_formal_generic_name
			has_type := False
			has_formal_generic_name := True
		ensure
			formal_name.is_equal (a_formal_name)
			formal_generic_name.is_equal (a_formal_generic_name)
		end

feature -- Access
	formal_name: STRING

	formal_generic_name: STRING

	type: TBON_TC_CLASS_TYPE

feature -- Status report
	has_formal_generic_name: BOOLEAN

	has_type: BOOLEAN

	is_equal (other: like Current): BOOLEAN
		do
			Result := (formal_name ~ other.formal_name) and
					  (has_type implies type ~ other.type) and
					  (has_formal_generic_name implies formal_generic_name ~ other.formal_generic_name)

		end

feature -- Element change
	set_type (a_type: TBON_TC_CLASS_TYPE)
		do
			type := a_type
		end

invariant
	formal_name /= Void
	has_type implies type /= Void
	has_formal_generic_name implies formal_generic_name /= Void
	has_formal_generic_name xor has_type

end
