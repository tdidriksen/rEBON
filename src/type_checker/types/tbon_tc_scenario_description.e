note
	description: "A dynamic scenario description in textual BON - used for type checking."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_SCENARIO_DESCRIPTION

inherit
	TBON_TC_DYNAMIC_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialization
	make (a_name: STRING)
			-- Initialize `Current'.
		do
			Precursor {TBON_TC_DYNAMIC_OBJECT} (a_name)
			create {ARRAYED_LIST[TBON_TC_TUPLE[STRING,STRING]]} labeled_actions.make (10)
		end

feature -- Access
	labeled_actions: LIST[TBON_TC_TUPLE[STRING, STRING]]
			-- What are the labeled actions of `Current'?

feature -- Element change
	add_labeled_action (an_action: TBON_TC_TUPLE[STRING, STRING])
			-- Add `an_action' to `labeled_actions'.
		do
			labeled_actions.extend (an_action)
		end

feature -- Status report
	has_labeled_action (an_action_label: STRING): BOOLEAN
			-- Does `labeled_actions' have an action with action label `an_action_label'?
		do
			Result := labeled_actions.there_exists (
				agent (action: TBON_TC_TUPLE[STRING, STRING]; action_label: STRING): BOOLEAN
					do
						Result := action.first ~ action_label
					end (?, an_action_label)
			)
		end

end
