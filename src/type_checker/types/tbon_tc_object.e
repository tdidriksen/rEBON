note
	description: "An object in textual BON - used for type checking."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_OBJECT

inherit
	TBON_TC_DYNAMIC_OBJECT
		export
			{NONE} make
		end

create
	make_object

feature -- Initialization
	make_object (a_class_name, an_extended_id: STRING)
			-- Initialize `Current'.
		do
			class_name := a_class_name.string
			name := class_name -- name represents the full object name, i.e. 'class_name'.'extended_id'
			if an_extended_id /= Void then
				extended_id := an_extended_id.string
				name.append_character ('.')
				name.append (extended_id)
			end
		end

feature -- Access
	class_name: STRING
			-- What is the class name of `Current'?

	extended_id: STRING
			-- What is the extended ID of `Current'?

	group: TBON_TC_OBJECT_GROUP
			-- To which group does `Current' belong?

feature -- Element change
	set_group (a_group: like group)
			-- Set the group of `Current' to `a_group'.
		do
			group := a_group
		ensure
			equal (group, a_group)
		end

	set_is_object_stack
			-- Set `is_object_stack' to True.
		do
			is_object_stack := True
		ensure
			is_object_stack: is_object_stack
		end

feature -- Status report
	is_object_stack: BOOLEAN
			-- Does `Current' represent a stack of object.
			-- There is no difference between an object and an object stack, type checking-wise.

end
