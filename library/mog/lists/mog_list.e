note
	description: "A list of items with a parser-specific initialization %
					% interface."

deferred class
	MOG_LIST [G -> HASHABLE]

inherit
	BON_TEXT

	CANONICALIZABLE

	DS_LINKED_LIST [G]

	PART_SEMANTICS

feature -- Initialization

	make_uniform_list (element: G; size: INTEGER)
			-- Initialize `Current' as a list containing 'size' references
			-- to 'element'.
		local
			i: INTEGER
		do
			make_default
			from
				i := 0
			until
				i = size
			loop
				put_first (element)

				i := i + 1
			end
		ensure
			count = size
			-- forall i: INTEGER, 0 <= i && i < count, get(i) = element
		end

	make_list (singleton: G)
			-- Initialize `Current'
		do
			make
			put_first (singleton)
		ensure
			has (singleton)
		end

	make_optional_rest (singleton: G; optional: like Current)
			-- Initialize `Current'
		require
			singleton /= Void
		do
			make
			put_first (singleton)
			if optional /= Void then --@changed didriksen - Added conditional
				append_last (optional)
			end
		ensure
			-- `Current' contains singleton and optional, but no other items.
		end

	make_optional_first (optional: like Current; singleton: G)
			-- Initialize `Current'
		require
			singleton /= Void
		do
			make
			put_first (singleton)
			if optional /= Void then --@changed didriksen - Added conditional
				append_first (optional)
			end
		ensure
			-- `Current' contains singleton and optional, but no other items.
		end

	make_from_list (list: like Current)
			-- Initialize `Current'
		do
			make
			append_last (list)
		ensure
			is_equal (list)
		end

	make_from_set (set: MOG_SET [G])
			-- Initialize `Current' from a set.
		do
			check false end
		ensure
			to_set.is_equal (set)
		end

feature -- Conversion

	to_set: MOG_SET [G]
			-- Convert `Current' into a set.
			-- This feature removes duplicate elements.
		do
			from
				start
			until
				not after
			loop
				Result.put (item_for_iteration)
			end
		ensure
			-- forall e in Result, has (e)
			non_increasing_count: count >= Result.count
		end

feature -- Output

	bon_out: STRING
			-- The default BON string representation of a list is a comma-separated
			-- sequence of its values.
		do
			check false end
		end

feature -- Status report

	is_part_of (other: like Current): BOOLEAN
		do
			check false end
		end

	contains (other: like Current): BOOLEAN
		do
			Result := other.for_all (agent (other_item: G): BOOLEAN do Result := Current.occurrences (other_item) > 0 end)
		end

	is_disjoint (other: like Current): BOOLEAN
		do
			check false end
		end

feature -- Basic operations
	merge (other: like Current): like Current
		do
			check false end
		end

	intersect (other: like Current): like Current
		do
			check false end
		end

	subtract (other: like Current): like Current
		do
			check false end
		end

	symdif (other: like Current): like Current
		do
			check false end
		end

feature -- Transformation

	canonicalize: like Current
		do
			check false end
		end

end -- class MOG_LIST
