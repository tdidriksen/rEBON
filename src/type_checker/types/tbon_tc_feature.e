note
	description: "A feature - used in textual BON type checking."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_FEATURE

create
	make

feature -- Initialization
	make (a_name: STRING; a_type: TBON_TC_CLASS_TYPE)
		do
			name := a_name.string
			type := a_type
		end

feature -- Access
	name: STRING

	selective_export: LIST[STRING]

	type: TBON_TC_CLASS_TYPE

	arguments: LIST[TBON_TC_FEATURE_ARGUMENT]

feature -- Status report
	is_unclassified: BOOLEAN

	is_deferred: BOOLEAN

	is_effective: BOOLEAN

	is_redefined: BOOLEAN

feature -- Element change
	set_is_deferred
		do
			is_deferred := True
			is_unclassified := False
		ensure
			is_deferred: is_deferred
			not is_unclassified
		end

	set_is_effective
		do
			is_effective := True
			is_unclassified := False
		ensure
			is_effective: is_effective
			not is_unclassified
		end

	set_is_redefined
		do
			is_redefined := True
			is_unclassified := False
		ensure
			is_redefined: is_redefined
			not is_unclassified
		end

	set_is_renamed
		do
			is_renamed := True
		ensure
			is_renamed: is_renamed
		end

feature -- Renaming
	is_renamed: BOOLEAN

	new_name: STRING

	renamed_from_class: TBON_TC_CLASS_TYPE

invariant
	is_unclassified xor is_deferred xor is_effective xor is_redefined
	is_renamed implies (new_name /= Void and not new_name.is_empty and renamed_from_class /= Void)


end
