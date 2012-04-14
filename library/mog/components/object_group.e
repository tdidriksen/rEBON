note
   description: "A group of objects."

class
   OBJECT_GROUP

inherit
   DYNAMIC_COMPONENT

create
   make

feature -- Initialization

   make (l_is_nameless: BOOLEAN; a_group_name: STRING; a_comment: COMMENT; some_group_components: DYNAMIC_COMPONENTS)
         -- Initialize `Current'.
      require
      	a_group_name /= Void and then not a_group_name.is_empty
      	a_comment /= Void implies not a_comment.is_empty
      	some_group_components /= Void implies not some_group_components.is_empty
      do
		is_nameless := l_is_nameless

		my_group_name := a_group_name.twin

		if a_comment /= Void then
			my_comment := a_comment.twin
		end

		if some_group_components /= Void then
			my_group_components := some_group_components
		end
	  ensure
	  	is_nameless = l_is_nameless
	  	group_name.is_equal (a_group_name)
	  	a_comment /= Void implies equal (comment, a_comment)
	  	some_group_components /= Void implies equal (group_components, some_group_components)
      end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_group_name.hash_code
		end

	group_name: STRING
		do
			Result := my_group_name.twin
		end

	comment: COMMENT
		do
			Result := my_comment.twin
		end

	group_components: DYNAMIC_COMPONENTS
		do
			Result := my_group_components.twin
		end


feature -- Output

	bon_out: STRING
			-- The default BON string representation of a list is a comma-separated
			-- sequence of its values.
		do
			check false end
		end

feature -- Status report
	is_nameless: BOOLEAN
			-- Is `Current' nameless?

	has_group_components: BOOLEAN
		do
			Result := my_group_components /= Void and then not my_group_components.is_empty
		end

	has_comment: BOOLEAN
		do
			Result := my_comment /= Void and then not my_comment.is_empty
		end

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

feature -- Transformation

	canonicalize: like Current
		do
			check false end
		end

feature {NONE} -- Implementation

	my_group_name: STRING
	my_comment: COMMENT
	my_group_components: DYNAMIC_COMPONENTS


invariant
   my_group_name /= Void and then not my_group_name.is_empty
   my_comment /= Void implies not my_comment.is_empty
   my_group_components /= Void implies not my_group_components.is_empty

end -- class OBJECT_GROUP
