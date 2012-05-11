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
	make

feature -- Initialization
	make (a_formal_name: STRING; a_type: TBON_TC_CLASS_TYPE; an_enclosing_feature: TBON_TC_FEATURE)
		require
			a_formal_name /= Void and then not a_formal_name.is_empty
			an_enclosing_feature /= Void
		do
			formal_name := a_formal_name.string
			type := a_type
			enclosing_feature := an_enclosing_feature
		ensure
			formal_name.is_equal (a_formal_name)
			equal (type, a_type)
			equal (enclosing_feature, an_enclosing_feature)
		end

feature -- Access
	enclosing_feature: TBON_TC_FEATURE

	formal_name: STRING

	type: TBON_TC_CLASS_TYPE

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := (formal_name ~ other.formal_name) and
					  (type ~ other.type)
		end

feature -- Element change
	set_type (a_type: TBON_TC_CLASS_TYPE)
		do
			type := a_type
		end

feature {TEXTUAL_BON_TYPE_CHECKER} -- Implementation
	associated_class_type: CLASS_TYPE
			-- What is the associated abstract syntax type of this feature argument?

	set_associated_class_type (a_class_type: like associated_class_type)
			-- Set the associated class type.
		require
			not_void: a_class_type /= Void
		do
			associated_class_type := a_class_type
		end

invariant
	formal_name /= Void
	enclosing_feature /= Void

end
