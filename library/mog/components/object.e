note
   description: "A reference to an object."

class
   OBJECT

inherit
   DYNAMIC_COMPONENT

create
   make

feature -- Initialization

   make (an_object_name: OBJECT_NAME; a_comment: COMMENT)
         -- Initialize `Current'.
      require
      	an_object_name /= Void
      do
		my_name := an_object_name.twin
		if a_comment /= Void then
			my_comment := a_comment.twin
		end
	  ensure
	  	equal (name, an_object_name)
	  	a_comment /= Void implies equal (comment, a_comment)
      end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_name.hash_code
		end

	name: OBJECT_NAME
			-- What is the name of `Current'?
		do
			Result := my_name.twin
		end

	comment: COMMENT
			-- What is the comment of `Current'?
		do
			Result := my_comment.twin
		end

feature -- Output

	bon_out: STRING
			-- The default BON string representation of an object.
		do
			check false end
		end

feature -- Status report
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
	my_name: OBJECT_NAME
	my_comment: COMMENT

invariant
   my_name /= Void and then not my_name.class_name.is_empty
   my_comment /= Void implies not my_comment.is_empty

end -- class OBJECT
