note
	description: "The specification of an event and the classes involved."

class
	EVENT_ENTRY

inherit
	ENTRY

	HASHABLE
		redefine
			is_equal
		end

creation
	make

feature -- Initialization

	make (a_name: STRING; some_classes_involved: CLASS_NAME_LIST)
			-- Initialize `Current'.
		do
			create my_name.make_from_string (a_name)
			set_classes_involved (some_classes_involved)
		ensure
			name.is_equal (a_name)
			classes_involved.contains (some_classes_involved)
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

	classes_involved: CLASS_NAME_LIST
		do
			Result := my_classes_involved.twin
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := equal (my_name, other.my_name) and
				equal (my_classes_involved, other.my_classes_involved)
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

	set_classes_involved (some_classes_involved: CLASS_NAME_LIST)
		require
			some_classes_involved /= Void
		do
			my_classes_involved := some_classes_involved
		ensure
			classes_involved.contains (some_classes_involved)
			classes_involved.for_all (agent (class_name: STRING): BOOLEAN do Result := classes_involved.occurrences (class_name) = 1 end)
		end

feature -- Removal

	wipe_out
		do
			clear_name
			clear_classes_involved
		ensure then
			name.is_empty
			classes_involved.is_empty
		end

	clear_name
		do
			my_name.wipe_out
		ensure
			name.is_empty
		end

	clear_classes_involved
		do
			my_classes_involved.wipe_out
		ensure
			classes_involved.is_empty
		end

feature -- Output

	bon_out: STRING
		do
			create Result.make_from_string ("event%N")
			Result.append (my_name.out + "%N")
			Result.append ("involves%N")
			Result.append (my_classes_involved.bon_out)
			Result.append ("%N")
		end

feature {EVENT_ENTRY} -- Implementation

	my_name: STRING
	my_classes_involved: CLASS_NAME_LIST

invariant

	my_name /= Void
	my_classes_involved /= Void

end -- class EVENT_ENTRY
