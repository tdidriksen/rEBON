note
	description: "A feature argument - used for type checking of textual BON."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_FEATURE_ARGUMENT

create
	make

feature -- Initialization
	make (a_formal_name: STRING; a_type: TBON_TC_CLASS_TYPE)
		require
			a_formal_name /= Void and then not a_formal_name.is_empty
			a_type /= Void
		do
			formal_name := a_formal_name.string
			type := a_type
		ensure
			formal_name.is_equal (a_formal_name)
			equal (type, a_type)
		end

feature -- Access
	formal_name: STRING

	type: TBON_TC_CLASS_TYPE

feature -- Element change
	set_type (a_type: TBON_TC_CLASS_TYPE)
		do
			type := a_type
		end

invariant
	formal_name /= Void
	type /= Void

end
