note
	description: "A list of client entities or a multiplicity."
	author: "Joseph R. Kiniry <kiniry@kindsoftware.com>"
	date: "$Date: 2005/05/02 22:58:30 $"
	revision: "$Revision: 1.1 $"

class CLIENT_ENTITIES

	-- The multiplicity and undefinedness of an object of this class is
	-- fixed when it is created; they cannot be later changed.

inherit
	MOG_LIST [CLIENT_ENTITY]

create
	make_undefined,
	make_list, make_optional_rest, make_optional_first, make_from_list

feature -- Initialization

	make_undefined (a_multiplicity: INTEGER)
			-- Initialize `Current' with the given multiplicity.
		require
			a_multiplicity > 0
		local
			an_undefined_client_entity: CLIENT_ENTITY
		do
			create an_undefined_client_entity.make_undefined
			make_uniform_list (an_undefined_client_entity, a_multiplicity)
			my_undefined := True
		ensure
			count = a_multiplicity
			undefined
		end

feature -- Access

	multiplicity: INTEGER
			-- The multiplicity of `Current'.
		do
			Result := count
		ensure
			Result > 0
		end

	undefined: BOOLEAN
			-- Is `Current' an undefined set of client entities?
		do
			Result := my_undefined
		end

feature -- Implementation

	type_of_contents: BOOLEAN
			-- Implements the invariant type_of_contents.
		do
			Result := (for_all (agent is_undefined) and undefined)
					  xor (not for_all (agent is_undefined) and not undefined)
		end

feature {CLIENT_ENTITIES} -- Implementation
	is_undefined (entity: CLIENT_ENTITY): BOOLEAN
			-- Is `entity' an undefined entity?
		do
			Result := entity.undefined
		end

	my_undefined: BOOLEAN

invariant

	-- there is always at least one client
	multiplicity > 0
	-- either all entries are undefined CLIENT_ENTITYs, or none are.
	type_of_contents

end -- class CLIENT_ENTITIES
