note
   description: "A dynamic diagram."

class
   DYNAMIC_DIAGRAM

inherit
   SPECIFICATION_ELEMENT

   DIAGRAM

create
   make

feature -- Initialization

	make (a_name: STRING; a_comment: COMMENT; some_components: DYNAMIC_COMPONENTS)
			-- Initialize `Current'.
		do
			if a_name /= Void then
				create my_name.make_from_string (a_name)
			end

			if my_comment /= Void then
				create my_comment.make_from_list (a_comment)
			end

			if some_components /= Void then
				my_components := some_components.twin
			end
		ensure
			a_name /= Void implies name.is_equal (a_name)
			my_comment /= Void implies comment.is_equal (a_comment)
			some_components /= Void implies components.is_equal (some_components)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := my_name.hash_code
		end

	name: STRING
			-- The name of this diagram.
		do
			Result := my_name.twin
		end

	comment: COMMENT
			-- The comment applied to this diagram.
		do
			Result := my_comment.twin
		end

	components: DYNAMIC_COMPONENTS
			-- The static components contained in this diagram.
		do
			Result := my_components.twin
		end

feature -- Status report
	has_name: BOOLEAN
			-- Does this diagram have a name?
		do
			Result := my_name /= Void and then not my_name.is_empty
		end

	has_comment: BOOLEAN
			-- Does this diagram have a comment?
		do
			Result := my_comment /= Void and then not my_comment.is_empty
		end

	has_components: BOOLEAN
			-- Does this diagram have any components?
		do
			Result := my_components /= Void and then not my_components.is_empty
		end

	is_valid: BOOLEAN
		do
			check false end
		end

	components_count: INTEGER
			-- The number of components in `Current'.
		do
			Result := components.count
		end

feature -- Duplication

	copy (other: like Current)
		do
			check false end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := equal (my_name, other.my_name)
			Result := Result and (my_comment /= Void implies equal (my_comment, other.my_comment))
			Result := Result and (my_components /= Void implies (equal (my_components, other.my_components)))
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

	set_comment (a_comment: COMMENT)
		require
			a_comment /= Void
		do
			my_comment := a_comment.twin
		ensure
			comment.is_equal (a_comment)
		end

	set_components (some_components: DYNAMIC_COMPONENTS)
		do
			my_components.wipe_out
			components.append (some_components.twin)
		ensure
			components.is_equal (some_components)
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

feature -- Status report

	is_part_of (other: like Current): BOOLEAN
		do
			check false end
		end

	contains (other: like Current): BOOLEAN
		do
			check false end
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

feature {DYNAMIC_DIAGRAM} -- Implementation

	my_name: STRING
	my_comment: COMMENT
	my_components: DYNAMIC_COMPONENTS

invariant
	my_name /= Void
	my_comment /= Void implies not my_comment.is_empty
	my_components /= Void implies not my_components.is_empty

end -- class DYNAMIC_DIAGRAM
