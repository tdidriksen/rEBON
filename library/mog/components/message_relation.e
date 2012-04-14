note
   description: "A relation between a caller object and a receiver object."

class
   MESSAGE_RELATION

inherit
   DYNAMIC_COMPONENT

create
   make

feature -- Initialization

   make (a_caller, a_receiver: DYNAMIC_REF; a_message_label: STRING)
         -- Initialize `Current'.
      require
      	a_caller /= Void
      	a_receiver /= Void
      	a_message_label /= Void implies not a_message_label.is_empty
      do
		my_caller := a_caller.twin
		my_receiver := a_receiver.twin
		if a_message_label /= Void then
			my_message_label := a_message_label.twin
		end
	  ensure
	  	equal (caller, a_caller)
	  	equal (receiver, a_receiver)
	  	a_message_label /= Void implies message_label.is_equal (a_message_label)
      end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_caller.hash_code + my_receiver.hash_code
		end

	caller: DYNAMIC_REF
			-- What is the caller of `Current'?
		do
			Result := my_caller.twin
		end

	receiver: DYNAMIC_REF
			-- What is the receiver of `Current'?
		do
			Result := my_receiver.twin
		end

	message_label: STRING
			-- What is the message label of `Current'?
		do
			Result := my_message_label.twin
		end

feature -- Output

	bon_out: STRING
			-- The default BON string representation of a list is a comma-separated
			-- sequence of its values.
		do
			check false end
		end

feature -- Status report
	has_message_label: BOOLEAN
			-- Does `Current' have a message label?
		do
			Result := my_message_label /= Void and then not my_message_label.is_empty
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

	my_caller: DYNAMIC_REF
	my_receiver: DYNAMIC_REF
	my_message_label: STRING

invariant
	my_caller /= Void
	my_receiver /= Void
	my_message_label /= Void implies not my_message_label.is_empty


end -- class MESSAGE_RELATION
