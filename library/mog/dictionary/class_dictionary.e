note
	description: "A dictionary of classes."

class
	CLASS_DICTIONARY

inherit
	SPECIFICATION_ELEMENT
		redefine
			bon_out,
			canonicalize,
			hash_code,
			is_equal,
			is_valid
		end

create
	make

feature -- Initialization

	make (a_name: STRING; some_entries: DICTIONARY_ENTRIES)
			-- Initialize `Current'.
		do
			my_name := a_name.twin
			my_entries := some_entries.twin
		ensure
			name.is_equal (a_name)
			equal (entries, some_entries)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := my_name.hash_code
		end

	name: STRING
			-- The system name for which `Current' holds.
		do
			Result := my_name.twin
		end

	entries: DICTIONARY_ENTRIES
			-- The entries in `Current'.
		do
			Result := my_entries.twin
		end

feature -- Measurement

	count: INTEGER
			-- The number of entries in `Current'.
		do
			Result := my_entries.count
		end

feature -- Status report

	is_valid: BOOLEAN
		do
			check false end
		end

feature -- Duplication

	copy (other: like Current)
		do
			check false end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			check false end
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

	set_entries (some_entries: DICTIONARY_ENTRIES)
		do
			my_entries.wipe_out
			my_entries.append (some_entries.twin)
		ensure
			entries = some_entries
		end

	add_entries (some_entries: DICTIONARY_ENTRIES)
		do
			my_entries.append (some_entries.twin)
		ensure
			some_entries.is_subset (entries)
		end

	add_entry (entry: DICTIONARY_ENTRY)
		do
			my_entries.put (entry)
		ensure
			entries.has (entry)
		end

feature -- Removal

	wipe_out
		do
			clear_entries
		ensure
			entries.is_empty
		end

	clear_entries
			-- Remove all entries.
		do
			my_entries.wipe_out
		ensure
			entries.is_empty
		end

feature -- Transformation

	canonicalize: like Current
		do
			check false end
		end

feature -- Output

	bon_out: STRING
		do
			check false end
		end

feature {CLASS_DICTIONARY} -- Implementation

	my_name: STRING
	my_entries: DICTIONARY_ENTRIES

invariant

	my_name /= Void
	my_entries /= Void

end -- class CLASS_DICTIONARY
