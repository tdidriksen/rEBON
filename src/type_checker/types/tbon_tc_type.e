note
	description: "A type. Serves as base class for all types related to type checking of textual BON."
	author:"Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TBON_TC_TYPE

inherit
	ANY
		undefine
			conforms_to
		end

	MML_MODEL
		undefine
			conforms_to
		end

	TBON_TC_TEXT_ITEMS
		undefine
			conforms_to
		end

feature -- Access
	name: STRING
			-- What is the name of this type?

feature -- Status report
	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		deferred
		end

end
