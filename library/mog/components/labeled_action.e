	note
	description: "A labeled action."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LABELED_ACTION

inherit
	HASHABLE

create
	make

feature -- Initialization
	make (an_action_label, an_action_description: STRING)
			-- Initialize `Current'.
		require
			an_action_label /= Void and then not an_action_label.is_empty
			an_action_description /= Void and then not an_action_description.is_empty
		do
			my_action_label := an_action_label.twin
			my_action_description := an_action_description.twin
		ensure
			action_label.is_equal (an_action_label)
			action_description.is_equal (an_action_description)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_action_label.hash_code + my_action_description.hash_code
		end

	action_label: STRING
			-- What is the action label of `Current'?
		do
			Result := my_action_label.twin
		end

	action_description: STRING
			-- What is the action description of `Current'?
		do
			Result := my_action_description.twin
		end

feature {NONE} -- Implementation

	my_action_label: STRING
	my_action_description: STRING

invariant
	my_action_label /= Void and then not my_action_label.is_empty
	my_action_description /= Void and then not my_action_description.is_empty

end
