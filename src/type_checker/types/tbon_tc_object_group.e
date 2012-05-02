note
	description: "An object group in textual BON - used for type checking."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_OBJECT_GROUP

inherit
	TBON_TC_DYNAMIC_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialization
	make (a_name: STRING)
			-- Initialize `Current'.
		do
			Precursor {TBON_TC_DYNAMIC_OBJECT} (a_name)
			create components.default_create
		end

feature -- Access
	components: MML_SET[TBON_TC_DYNAMIC_OBJECT]
			-- What are the components of `Current'?

	group: TBON_TC_OBJECT_GROUP
			-- What is the enclosing object group of `Current'?

feature -- Status report
	is_nameless: BOOLEAN
			-- Is `Current' a nameless object group?

feature -- Element change
	set_group (a_group: like group)
			-- Set group to of `Current' to `a_group'.
		require
			a_group /= Void
		do
			group := a_group
		end

	set_is_nameless
			-- Set `is_nameless' to True.
		do
			is_nameless := True
		ensure
			is_nameless: is_nameless
		end

invariant
	name /= Void and then not name.is_empty

end
