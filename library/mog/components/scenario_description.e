note
   description: "A description of a scenario."

class
   SCENARIO_DESCRIPTION

inherit
   DYNAMIC_COMPONENT

create
   make

feature -- Initialization

   make (a_scenario_name: STRING; a_comment: COMMENT; some_labeled_actions: LABELED_ACTIONS)
         -- Initialize `Current'.
      require
      	a_scenario_name /= Void
      	a_comment /= Void implies not a_comment.is_empty
      	some_labeled_actions /= Void and then not some_labeled_actions.is_empty
      do
      	my_scenario_name := a_scenario_name.twin

      	if a_comment /= Void then
      		my_comment := a_comment.twin
      	end

      	my_labeled_actions := some_labeled_actions.twin
      ensure
      	scenario_name.is_equal (a_scenario_name)
      	a_comment /= Void implies equal (comment, a_comment)
      	equal (labeled_actions, some_labeled_actions)
      end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_scenario_name.hash_code
		end

	scenario_name: STRING
			-- What is the scenario name of `Current'?
		do
			Result := my_scenario_name.twin
		end

	comment: COMMENT
			-- What is the comment of `Current'?
		do
			Result := my_comment.twin
		end

	labeled_actions: LABELED_ACTIONS
			-- What are the labeled actions of `Current'?
		do
			Result := my_labeled_actions.twin
		end

feature -- Status report
	has_comment: BOOLEAN
			-- Does `Current' have a comment?
		do
			Result := my_comment /= Void and then not my_comment.is_empty
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

	my_scenario_name: STRING
	my_comment: COMMENT
	my_labeled_actions: LABELED_ACTIONS

invariant
	my_scenario_name /= Void and then not my_scenario_name.is_empty
	my_comment /= Void implies not my_comment.is_empty
	my_labeled_actions /= Void and then not my_labeled_actions.is_empty


end -- class SCENARIO_DESCRIPTION
