note
	description: "A description of a cluster."

class
	CLUSTER_ENTRY

inherit
	ENTRY
		redefine
			bon_out
		end

	HASHABLE
		redefine
			is_equal
		end

creation
	make

feature -- Initialization

	make (a_name: STRING; a_description: STRING)
			-- Initialize `Current'.
		do
			create my_name.make_from_string (a_name)
			create my_description.make_from_string (a_description)
		ensure
			name.is_equal (a_name)
			description.is_equal (a_description)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := my_name.hash_code
		end

	name: STRING
		do
			Result := my_name.twin
		end

	description: STRING
		do
			Result := my_description.twin
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := equal (my_name, other.my_name) and
				equal (my_description, other.my_description)
		end

feature -- Element change

	set_name (a_name: STRING)
		require
			a_name /= Void
		do
			my_name := a_name.twin
		ensure
			name.is_equal (a_name)
		end

	set_description (a_description: STRING)
		require
			a_description /= Void
		do
			my_description := a_description.twin
		ensure
			description.is_equal (a_description)
		end

feature -- Removal

	wipe_out
			-- Remove all contents.
		do
			clear_name
			clear_description
		ensure then
			name.is_empty
			description.is_empty
		end

	clear_name
		do
			my_name.wipe_out
		ensure
			name.is_empty
		end

	clear_description
		do
			my_description.wipe_out
		ensure
			description.is_empty
		end

feature -- Output

	bon_out: STRING
		do
			create Result.make_from_string ("cluster " + my_name.out + "%N")
			Result.append ("description%N")
			Result.append ("%"" + my_description.out + "%"%N")
		end

feature {CLUSTER_ENTRY} -- Implementation

	my_name: STRING
	my_description: STRING

invariant

	my_name /= Void
	my_description /= Void

end -- class CLUSTER_ENTRY
