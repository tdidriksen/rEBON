note
	description: "A generic chart."

deferred class
	INFORMAL_CHART

inherit
	PART_SEMANTICS

	SPECIFICATION_ELEMENT

feature {NONE} -- Initialization

	make_informal_chart (a_name: STRING;
											 an_index: INDEX_LIST;
											 an_explanation: STRING;
											 a_part: STRING)
			-- Initialize `Current'.
		require
			a_name /= Void
			-- an_explanation /= Void --@changed didriksen - explanations are optional
			--a_part /= Void --@changed didriksen - parts are optional
		do
			create my_name.make_from_string (a_name)

			if an_index /= Void then
				create my_index.make_from_list (an_index)
			end

			if an_explanation /= Void then
				create my_explanation.make_from_string (an_explanation)
			end

			if a_part /= Void then
				create my_part.make_from_string (a_part)
			end
		ensure
			name.is_equal (a_name)
			an_index /= Void implies index.is_equal (an_index)
			an_explanation /= Void implies explanation.is_equal (an_explanation)
			a_part /= Void implies part.is_equal (a_part)
				--@changed didriksen - Added implications for all of the above to avoid feature call on void target.
		end

feature -- Duplication

	copy (other: like Current)
		do
			set_name (other.name)
			set_index (other.index)
			set_explanation (other.explanation)
			set_part (other.part)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := my_name.hash_code.abs

			if my_explanation /= Void then
				Result := Result + my_explanation.hash_code.abs
			end

			if my_part /= Void then
				Result := Result + my_part.hash_code.abs
			end

			if Result < 0 then
				Result := Result * -1
			end
		end

	name: STRING
			-- The name of this chart.
		do
			Result := my_name.twin
		ensure
			Result /= Void
		end

	index: INDEX_LIST
			-- The index list of this chart.
		do
			Result := my_index.twin
		ensure
			Result /= Void
		end

	explanation: STRING
			-- The explanation for this chart.
		do
			Result := my_explanation.twin
		ensure
			Result /= Void
		end

	part: STRING
			-- The part number of this chart.
		do
			Result := my_part.twin
		ensure
			Result /= Void
		end

feature -- Measurement

	index_count: INTEGER
			-- The number of index terms of this chart.
		do
			Result := my_index.count
		ensure
			Result >= 0
		end

feature -- Status report

	is_valid: BOOLEAN
			-- A valid informal chart has a non-trivial name.
		do
			Result := not name.is_empty
		ensure then
			Result = not name.is_empty
		end

	is_part_of (other: like Current): BOOLEAN
			-- An informal chart C is a part of another informal chart D iff
			-- C's index is a part of D's index and C's explanation is a part
			-- of D's explanation.  C and D's name and part are not considered.
		do
			Result := index.is_part_of (other.index) and
				other.explanation.has_substring (Current.explanation)
		end

	contains (other: like Current): BOOLEAN
		do
			Result := index.contains (other.my_index) and
				explanation.has_substring (other.explanation)
		end

	is_disjoint (other: like Current): BOOLEAN
		do
			Result := not is_part_of (other) and not other.is_part_of (Current)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := my_name.is_equal (other.my_name) and
				my_index.is_equal (other.my_index) and
				my_explanation.is_equal (other.my_explanation) and
				my_part.is_equal (other.my_part)
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

	set_index (an_index: INDEX_LIST)
		do
			my_index := an_index.twin
		ensure
			index.is_equal (an_index)
		end

	set_explanation (an_explanation: STRING)
		require
			an_explanation /= Void
		do
			my_explanation := an_explanation.twin
		ensure
			explanation.is_equal (an_explanation)
		end

	set_part (a_part: STRING)
		require
			a_part /= Void
		do
			my_part := a_part.twin
		ensure
			part.is_equal (a_part)
		end

	add_index_clause (a_clause: INDEX_CLAUSE)
		do
			my_index.put_last (a_clause)
		ensure
			index.has (a_clause)
		end

feature -- Removal

	wipe_out
			-- Remove all contents.
		do
			clear_name
			clear_index
			clear_explanation
			clear_part
		ensure
			name.is_empty
			index.is_empty
			explanation.is_empty
			part.is_empty
		end

	clear_name
		do
			my_name.wipe_out
		ensure
			name.is_empty
		end

	clear_index
		do
			my_index.wipe_out
		ensure
			index.is_empty
		end

	clear_explanation
		do
			my_explanation.wipe_out
		ensure
			explanation.is_empty
		end

	clear_part
		do
			my_part.wipe_out
		ensure
			part.is_empty
		end

feature -- Transformation

	canonicalize: like Current
			-- The canonical form of an informal chart is:
			--   a. duplicate properties are eliminated from the index list, and
			--   b. the resulting reduced index list is canonicalized
			-- No changes are made to the informal chart's name, explanation, or
			-- part.
		do
			Result := Current.twin
			Result.set_index (my_index.canonicalize)
		end

feature -- Output

	bon_out: STRING
		require else
			is_valid
		do
			create Result.make_from_string ("note%N")
			Result.append (my_index.bon_out)
			Result.append ("explanation%N")
			Result.append (my_explanation.out)
			Result.append ("part %"" + my_part.out + "%"%N")
		end

feature -- Basic operations

	merge (other: like Current): like Current
			-- Merge indices of two charts.  Likewise for other basic operations.
		do
			my_index := my_index.merge (other.my_index.twin)
		end

	intersect (other: like Current): like Current
		do
			my_index := my_index.intersect (other.my_index)
		end

	subtract (other: like Current): like Current
		do
			my_index := my_index.subtract (other.my_index)
		end

	symdif (other: like Current): like Current
		do
			my_index := my_index.symdif (other.my_index.twin)
		end

feature {INFORMAL_CHART} -- Implementation

	my_name: STRING
	my_index: INDEX_LIST
	my_explanation: STRING
	my_part: STRING

invariant

	name /= Void
	--index /= Void
	--explanation /= Void
	--part /= Void
		--@changed didriksen - Only 'name' is not optional. All others can be Void.

end -- class INFORMAL_CHART
