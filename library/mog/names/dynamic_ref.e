note
	description: "A dynamic reference to an object."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DYNAMIC_REF

create
	make_with_group_name, make_with_object_name

feature -- Initialization

	make_with_group_name (a_group_name: STRING; a_group_prefix: STRING)
			-- Initialize `Current' with the provided values.
		require
			a_group_name /= Void
			contains_only_valid_characters (a_group_name) and not a_group_name.has ('.')

			a_group_prefix /= Void implies
				contains_only_valid_characters (a_group_prefix) and
				no_bogus_dot_placement (a_group_prefix)
		do
			create my_group_name.make_from_string (a_group_name)

			if a_group_prefix /= Void then
				create my_group_prefix.make_from_string (a_group_prefix)
			end
		end

	make_with_object_name (an_object_name: OBJECT_NAME; a_group_prefix: STRING)
			-- Initialize `Current' with the provided values.
		require
			an_object_name /= Void
			contains_only_valid_characters (an_object_name.class_name) and not an_object_name.class_name.has ('.')
			an_object_name /= Void implies
				(an_object_name.has_extended_id implies not an_object_name.extended_id.has ('.'))

			a_group_prefix /= Void implies
				contains_only_valid_characters (a_group_prefix) and
				no_bogus_dot_placement (a_group_prefix)
		do
			my_object_name := an_object_name.twin

			if a_group_prefix /= Void then
				create my_group_prefix.make_from_string (a_group_prefix)
			end
		end

feature -- Access

	group_name: STRING
			-- The class name of this dynamic reference.
		do
			Result := my_group_name.twin
		end

	object_name: OBJECT_NAME
			-- The object name of this dynamic reference.
		do
			Result := my_object_name.twin
		end

	group_prefix: STRING
			-- The group prefix of this dynamic reference.
		do
			Result := my_group_prefix.twin
		end

	group (index: INTEGER): STRING
			-- The group indicated by the 'index' parameter, counting from 1.
			-- Thus, the group prefix "com.kindsoftware.ebon" has three
			-- group components: at index 1, "com", at index 2, "kindsoftware",
			-- and at index 3, "ebon".  A value of Void is returned if no group
			-- exists at 'index'.
		require
			index > 0
		local
			dot_location: INTEGER
			ith_group_start_location, ith_group_end_location: INTEGER
			i: INTEGER
		do
			if index = 1 then
				ith_group_start_location := 1
				ith_group_end_location := index_of_dot (1)
			else
				ith_group_start_location := index_of_dot (index - 1)
				ith_group_end_location := index_of_dot (index)
			end
			if ith_group_start_location = 0 or ith_group_end_location = 0 then
				Result := Void
			else
				Result := group_prefix.substring (ith_group_start_location, ith_group_end_location)
			end
		ensure
			Result = Void or (group_prefix.has_substring (Result) and not Result.has ('.'))
		end

	hash_code: INTEGER
		do
			Result := 0

			if my_group_name /= Void then
				Result := Result + my_group_name.hash_code
			end
			if my_object_name /= Void then
				Result := Result + my_object_name.hash_code
			end
			if my_group_prefix /= Void then
				Result := Result + my_group_prefix.hash_code
			end

			if Result < 0 then
				Result := 1
			end
		end

feature -- Measurement

	group_count: INTEGER
			-- Return the number of group levels in this dynamic reference.
		do
				Result := count_dots (my_group_prefix) + 1
		end

feature -- Removal

	wipe_out
			-- Clear all values of this dynamic reference.
		do
			clear_group_name
			clear_object_name
			clear_group_prefix
		end

	clear_group_name
			-- Clear the group name of this dynamic reference.
		do
			my_group_name := Void
		end

	clear_object_name
			-- Clear the object name of this dynamic reference.
		do
			my_object_name := Void
		end

	clear_group_prefix
			-- Clear the group prefix of this dynamic reference.
		do
			my_group_prefix := Void
		end

feature -- Transformation

	canonicalize: like Current
		do
			Result := Current.twin
		end

feature -- Output

	bon_out: STRING
		do
			check false end
		end

feature -- Status Report
	has_group_name: BOOLEAN
			-- Does this reference have a group name?
		do
			Result := my_group_name /= Void and then not my_group_name.is_empty
		end

	has_group_prefix: BOOLEAN
			-- Does this reference have a group name?
		do
			Result := my_group_prefix /= Void
		end

	has_object_name: BOOLEAN
			-- Does this reference have an object name?
		do
			Result := my_object_name /= Void
		end

	contains_only_valid_characters (a_string: STRING): BOOLEAN
			-- The components in a dynamic reference can contain only the characters [a-zA-Z0-9_.]
		local
			i: INTEGER
			c: CHARACTER
		do
			Result := true
			from i := 1
			until i = a_string.count
			loop
				c := a_string @ i
				if not (c.is_alpha or c.is_digit or c = '.' or c = '_') then
					Result := false
				end

				i := i + 1
			end
		end

	no_bogus_dot_placement (a_string: STRING): BOOLEAN
			-- A group prefix must not start with a dot, nor can it end with a
			-- dot, nor can two dots be adjacent.
		do
			Result := true
			if a_string @ 1 = '.' or a_string @ a_string.count = '.' then
				Result := false
			end
			if a_string.has_substring ("..") then
				Result := false
			end
		end

	valid_dynamic_reference: BOOLEAN
			-- The components in a dynamic reference can contain only the characters [a-zA-Z0-9_.]
		do
			Result := true
			if my_group_name /= Void then
				Result := Result and contains_only_valid_characters (my_group_name)
			end
			if my_object_name /= Void then
				Result := Result and contains_only_valid_characters (my_object_name.class_name) and
					(my_object_name.has_extended_id implies contains_only_valid_characters (my_object_name.extended_id))
			end
			if my_group_prefix /= Void then
				Result := Result and contains_only_valid_characters (my_group_prefix) and
					no_bogus_dot_placement (my_group_prefix)
			end
		end

feature {NONE} -- Implementation

	count_dots (a_string: STRING): INTEGER
			-- Returns the number of dots in the passed string.
		require
			a_string /= Void and then not a_string.is_empty
			contains_only_valid_characters (a_string)
			no_bogus_dot_placement (a_string)
		local
			index: INTEGER
			count: INTEGER
		do
			from count := 0; index := 1
			until index = 0
			loop
				-- Starting from an index of 2 is fine because a_string cannot start
				-- with a dot anyway due to the invariants of DYNAMIC_REF.
				index := a_string.index_of ('.', index + 1)
				if index /= 0 then
					count := count + 1
				end
			end
			Result := count
			ensure
				Result >= 0
		end

	index_of_dot (d: INTEGER): INTEGER
			-- The index into group_prefix of the dth "dot" (period, '.'),
			-- or 0 if there is no such dot.
			-- E.g., the group prefix of "com.kindsoftware.ebon" would have
			-- index_of_dot (1) = 4 and index_of_dot (2) = 17.  For all other
			-- positive values of d > 2, index_of_dot(d) = 0.
		local
			i, start, location: INTEGER
		do
			if group_prefix /= Void then
				from i := 0; start := 1; location := 1
				until i = d or location = 0
				loop
					location := group_prefix.index_of ('.', start)
					start := location + 1
				end
				Result := location
			else
				Result := 0
			end
		end

	my_group_name: STRING
	my_object_name: OBJECT_NAME
	my_group_prefix: STRING

invariant
	my_group_name /= Void xor my_object_name /= Void
	my_group_name /= Void implies not my_group_name.is_empty
	my_group_name /= Void implies not my_group_name.has ('.')
	my_object_name /= Void implies not my_object_name.class_name.is_empty
	my_object_name /= Void implies not my_object_name.class_name.has ('.')
	my_object_name /= Void implies (my_object_name.has_extended_id implies not my_object_name.extended_id.has ('.'))
	my_group_prefix /= Void implies not my_group_prefix.is_empty
	valid_dynamic_reference

end
