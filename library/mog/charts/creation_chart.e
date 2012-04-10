note
	description: "A creation chart."

class
	CREATION_CHART

inherit
	INFORMAL_CHART
		redefine
			bon_out,
			canonicalize,
			copy, is_equal,
			is_part_of, contains, is_disjoint,
			merge, intersect, subtract, symdif,
			wipe_out
		end

creation
	make

feature -- Initialization

	make (a_name: STRING;
				an_index: INDEX_LIST;
				an_explanation: STRING;
				a_part: STRING;
				some_entries: CREATION_ENTRIES)
			-- Initialize `Current'.
		require
			a_name /= Void
			--an_explanation /= Void
			--a_part /= Void
		do
			make_informal_chart (a_name, an_index, an_explanation, a_part)
			if some_entries /= Void then
				create my_entries.make_from_set (some_entries)
			else
				create my_entries.make
			end
		ensure
			name.is_equal (a_name)
			an_index /= Void implies index.is_equal (an_index)
			an_explanation /= Void implies explanation.is_equal (an_explanation)
			a_part /= Void implies part.is_equal (a_part)
			some_entries /= Void implies entries.is_equal (some_entries)
		end

feature -- Duplication

	copy (other: like Current)
		do
			Precursor (other)
			set_entries (other.entries)
		end

feature -- Access

	entries: CREATION_ENTRIES
		do
			Result := my_entries.twin
		ensure
			non_void_result: Result /= Void
		end

feature -- Measurement

	entries_count: INTEGER
		do
			Result := my_entries.count
		ensure
			non_negative_result: Result >= 0
		end

feature -- Status report

	is_part_of (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_entries.is_part_of (other.entries)
		end

	contains (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_entries.contains (other.entries)
		end

	is_disjoint (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_entries.is_disjoint (other.entries)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_entries.is_equal (other.entries)
		end

feature -- Element change

	set_entries (some_entries: CREATION_ENTRIES)
		do
			my_entries := some_entries.twin
		ensure
			entries.is_equal (some_entries)
		end

	add_entries (some_entries: CREATION_ENTRIES)
		do
			my_entries := my_entries.merge (some_entries.twin)
		ensure
			some_entries.is_part_of (entries)
			entries_count = entries.merge (some_entries).count
		end

	add_entry (an_entry: CREATION_ENTRY)
		do
			my_entries.put (an_entry)
		ensure
			entries.has (an_entry)
			not (old entries).has (an_entry) implies entries_count = old entries_count + 1
			(old entries).has (an_entry) implies entries_count = old entries_count
		end

feature -- Removal

	wipe_out
			-- Remove all contents.
		do
			Precursor
			clear_entries
		ensure then
			entries.is_empty
		end

	clear_entries
		do
			my_entries.wipe_out
		ensure
			entries.is_empty
		end

	remove_entries (some_entries: CREATION_ENTRIES)
		do
			my_entries := my_entries.subtract (some_entries)
		ensure
			entries.is_disjoint (some_entries)
			entries_count = old entries_count - entries.intersect (some_entries).count
		end

	remove_entry (an_entry: CREATION_ENTRY)
		do
			my_entries.remove (an_entry)
		ensure
			not entries.has (an_entry)
			old entries.has (an_entry) implies entries_count = old entries_count - 1
			not old entries.has (an_entry) implies entries_count = old entries_count
		end

feature -- Transformation

	canonicalize: like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part, Void)
			Result.set_entries (entries.canonicalize)
		end

feature -- Output

	bon_out: STRING
		do
			create Result.make_from_string ("creation_chart " + my_name + "%N")
			Result.append (Precursor)
			Result.append (entries.bon_out)
			Result.append ("end%N")
		end

feature -- Basic operations

	merge (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part, Void)
			Result.set_entries (entries.merge (other.entries))
		end

	intersect (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part, Void)
			Result.set_entries (entries.intersect (other.entries))
		end

	subtract (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part, Void)
			Result.set_entries (entries.subtract (other.entries))
		end

	symdif (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part, Void)
			Result.set_entries (entries.symdif (other.entries))
		end

feature {CREATION_CHART} -- Implementation

	my_entries: CREATION_ENTRIES

invariant

	entries /= Void

end -- class CREATION_CHART
