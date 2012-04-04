note
	description: "A cluster type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_CLUSTER_TYPE

inherit
	TBON_TC_TYPE

create
	make

feature -- Initialization
	make (a_name: STRING)
			-- Create a cluster type for type checking.
		do
			name := a_name
		end

feature -- Access
	types: MML_SET[TBON_TC_TYPE]
			-- Which class types are contained in this cluster?

feature -- Element change
	add_type (a_type: TBON_TC_TYPE)
			-- Add `a_type' to `types'.
		do
			types := types & a_type
		end

feature -- Status report
	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		do
			Result := False
		end

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name
		end

end
