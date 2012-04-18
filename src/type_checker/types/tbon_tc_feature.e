note
	description: "A feature - used in textual BON type checking."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_FEATURE

inherit
	MML_MODEL
		redefine
			is_model_equal
		end

create
	make

feature -- Initialization
	make (a_name: STRING; a_type: TBON_TC_CLASS_TYPE; an_enclosing_class: TBON_TC_CLASS_TYPE)
		require
			a_name /= Void and then not a_name.is_empty
			an_enclosing_class /= Void
		do
			name := a_name.string
			type := a_type
			enclosing_class := an_enclosing_class

			create {LINKED_LIST[STRING]} selective_export.make
			selective_export.compare_objects
			create {LINKED_LIST[TBON_TC_FEATURE_ARGUMENT]} arguments.make
			arguments.compare_objects
		end

feature -- Access
	name: STRING

	enclosing_class: TBON_TC_CLASS_TYPE

	selective_export: LIST[STRING]

	type: TBON_TC_CLASS_TYPE

	arguments: LIST[TBON_TC_FEATURE_ARGUMENT]

feature -- Status report
	is_unclassified: BOOLEAN

	is_deferred: BOOLEAN

	is_effective: BOOLEAN

	is_redefined: BOOLEAN

	is_prefix: BOOLEAN

	is_infix: BOOLEAN

	is_model_equal alias "|=|" (other: TBON_TC_FEATURE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name and enclosing_class |=| other.enclosing_class
		end

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

	set_is_prefix
		do
			is_prefix := True
			is_infix := False
		ensure
			is_prefix: is_prefix
		end

	set_is_infix
		do
			is_infix := True
			is_prefix := False
		ensure
			is_infix: is_infix
		end

	set_selective_export (an_export_list: like selective_export)
		require
			an_export_list /= Void
		do
			selective_export := an_export_list
		end


	set_type (a_type: like type)
		require
			a_type /= Void
		do
			type := a_type
		end

feature -- Renaming
	is_renamed: BOOLEAN

	inherited_name: STRING

	renamed_from_class: TBON_TC_CLASS_TYPE

invariant
	is_unclassified xor is_deferred xor is_effective xor is_redefined
	is_renamed implies (inherited_name /= Void and not inherited_name.is_empty and renamed_from_class /= Void)
	is_infix implies not is_prefix
	is_prefix implies not is_infix


end
