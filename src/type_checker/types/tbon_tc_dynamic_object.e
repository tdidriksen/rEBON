note
	description: "A dynamic object in textual BON - used for type checking."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TBON_TC_DYNAMIC_OBJECT

inherit
	MML_MODEL

feature -- Initialization
	make (a_name: STRING)
			-- Initialize `Current'.
		require
			a_name /= Void and then not a_name.is_empty
		do
			name := a_name.string
		end

feature -- Access
	name: STRING
			-- What is the name of this dynamic object?

feature -- Status report
	is_model_equal alias "|=|" (other: like Current): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name
		end

end
