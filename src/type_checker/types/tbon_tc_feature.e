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
	make, make_with_formal_generic_name

feature -- Initialization
	make (a_name: STRING; a_type: TBON_TC_CLASS_TYPE; an_enclosing_class: TBON_TC_CLASS_TYPE)
			-- Initialize `Current'.
		require
			a_name /= Void and then not a_name.is_empty
			an_enclosing_class /= Void
		do
			name := a_name.string
			type := a_type
			enclosing_class := an_enclosing_class
			is_unclassified := True
			has_formal_generic_name := False
			has_type := True

			create {LINKED_LIST[STRING]} selective_export.make
			selective_export.compare_objects
			create {LINKED_LIST[TBON_TC_FEATURE_ARGUMENT]} arguments.make
			arguments.compare_objects
		end

	make_with_formal_generic_name (a_name: STRING; a_formal_generic_name: STRING; an_enclosing_class: TBON_TC_CLASS_TYPE)
			-- Initialize `Current'.
		require
			a_name /= Void and then not a_name.is_empty
			a_formal_generic_name /= Void and then not a_formal_generic_name.is_empty
			an_enclosing_class /= Void
		do
			name := a_name.string
			formal_generic_name := a_formal_generic_name
			enclosing_class := an_enclosing_class
			is_unclassified := True
			has_formal_generic_name := True
			has_type := False

			create {LINKED_LIST[STRING]} selective_export.make
			selective_export.compare_objects
			create {LINKED_LIST[TBON_TC_FEATURE_ARGUMENT]} arguments.make
			arguments.compare_objects
		end

feature -- Access
	name: STRING

	enclosing_class: TBON_TC_CLASS_TYPE

	selective_export: LIST[STRING]

	formal_generic_name: STRING

	type: TBON_TC_CLASS_TYPE

	arguments: LIST[TBON_TC_FEATURE_ARGUMENT]

	argument_with_name (a_name: STRING): TBON_TC_FEATURE_ARGUMENT
		do
			Result := Void
			from arguments.start until arguments.after
			loop
				if arguments.item.formal_name ~ a_name then
					Result := arguments.item
				end
			end
		end

	nearest_precursor: TBON_TC_FEATURE
			-- What is the nearest precursor to `a_feature'?
		do
			Result := precursor_feature (enclosing_class)
		end

feature {NONE} -- Implementation
	precursor_feature (current_class: TBON_TC_CLASS_TYPE): TBON_TC_FEATURE
			-- What is the precursor to `a_feature' from class `current_class'?
		local
			l_precursor: TBON_TC_FEATURE
			ancestors: MML_SET[TBON_TC_CLASS_TYPE]
			ancestor: TBON_TC_CLASS_TYPE
		do
			-- Iterate through ancestors
			from
				ancestors := current_class.ancestors.twin
				l_precursor := Void
			until
				ancestors.is_empty or l_precursor /= Void
			loop
				ancestor := ancestors.any_item

				if Current.is_renamed then
					l_precursor := ancestor.feature_with_name (Current.inherited_name, Current.is_prefix, Current.is_infix)
				else
					l_precursor := ancestor.feature_with_name (Current.name, Current.is_prefix, Current.is_infix)
				end

				ancestors := ancestors / ancestor
			end

			-- If no precursor was found, call recursively on ancestors
			if l_precursor = Void then
				from
					ancestors := current_class.ancestors.twin
				until
					ancestors.is_empty or l_precursor /= Void
				loop
					ancestor := ancestors.any_item

					l_precursor := precursor_feature (ancestor)

					ancestors := ancestors / ancestor
				end
			end

			Result := l_precursor
		end

feature -- Status report
	equal_status (other: like Current): BOOLEAN
		do
			Result := (is_deferred and other.is_deferred) or
					  (is_effective and other.is_effective) or
					  (is_redefined and other.is_redefined) or
					  (is_unclassified and other.is_unclassified)
		end

	has_formal_generic_name: BOOLEAN

	has_type: BOOLEAN

	is_unclassified: BOOLEAN

	is_deferred: BOOLEAN

	is_effective: BOOLEAN

	is_redefined: BOOLEAN

	is_prefix: BOOLEAN

	is_infix: BOOLEAN

	is_model_equal alias "|=|" (other: TBON_TC_FEATURE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name and
					  enclosing_class |=| other.enclosing_class and
					  (is_prefix implies other.is_prefix) and
					  (is_infix implies other.is_infix)

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

	set_formal_generic_name (a_formal_generic_name: like formal_generic_name)
		require
			a_formal_generic_name /= Void
		do
			formal_generic_name := a_formal_generic_name
			has_formal_generic_name := True
			has_type := False
		end

	set_type (a_type: like type)
		require
			a_type /= Void
		do
			type := a_type
			has_type := True
			has_formal_generic_name := False
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
	has_formal_generic_name xor has_type


end
