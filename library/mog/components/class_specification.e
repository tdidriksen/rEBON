note
	description: "A specification of a class."

class
	CLASS_SPECIFICATION

inherit
	STATIC_COMPONENT
		rename
			is_equal as is_equal_component,
			copy as copy_component,
			bon_out as bon_out_component
		end

	STATIC_DIAGRAM
		redefine
			is_equal, copy,
			bon_out,
			canonicalize,
			hash_code,
			is_part_of, contains, is_disjoint,
			merge, intersect, subtract, symdif
		select
			is_equal, copy,
			bon_out
		end

create
	make

feature -- Initialization

	make (a_classifier: STRING;
			a_name: STRING;
			some_generics: FORMAL_GENERIC_LIST;
			a_reused_flag: BOOLEAN;
			a_persistent_flag: BOOLEAN;
			an_interfaced_flag: BOOLEAN;
			a_comment: COMMENT;
			a_class_interface: CLASS_INTERFACE)
			-- Initialize `Current'.
			-- @todo: some_generics
		require
			a_classifier /= Void implies (a_classifier.is_equal ("ROOT") or
													a_classifier.is_equal ("DEFERRED") or
													a_classifier.is_equal ("EFFECTIVE"))
			a_name /= Void
		do
			set_name (a_name)

			if a_classifier /= Void then
				set_classifier (a_classifier)
			end

			if some_generics /= Void then
				set_generics (some_generics)
			end

			set_reused (a_reused_flag)
			set_persistent (a_persistent_flag)
			set_interfaced (an_interfaced_flag)

			if a_class_interface /= Void then
				set_class_interface (a_class_interface)
			end
			-- last argument needs to be an instance of STATIC_COMPONENTS,
			-- which is a deferred class inheriting from MOG_SET.
			make_static_diagram (a_name, a_comment,
													create {STATIC_COMPONENTS}.make_set (Current))
		ensure
			a_classifier /= Void implies classifier.is_equal (a_classifier)
			reused = a_reused_flag
			persistent = a_persistent_flag
			interfaced = an_interfaced_flag
			some_generics /= Void implies generics.is_equal (some_generics)
			a_class_interface /= Void implies class_interface.is_equal (a_class_interface)
		end

feature -- Access

	hash_code: INTEGER
		do
			Result := name.hash_code
		end

	classifier: STRING
			-- The classifier applied to `Current', if any.
		do
			Result := my_classifier.twin
		end

	generics: FORMAL_GENERIC_LIST
			-- The generic parameters of `Current'.
		do
			Result := my_generics.twin
		end

	reused: BOOLEAN
			-- Is `Current' reusable?
		do
			Result := my_reused_flag
		end

	persistent: BOOLEAN
			-- Is `Current' persistent?
		do
			Result := my_persistent_flag
		end

	interfaced: BOOLEAN
			-- Is `Current' interfaced?
		do
			Result := my_interfaced_flag
		end

	class_interface: CLASS_INTERFACE
			-- The class interface of `Current'.
		do
			Result := my_class_interface.twin
		end

feature -- Element change

	set_classifier (a_classifier: STRING)
			-- Set the classifier of `Current'.
		require
			a_classifier /= Void implies (a_classifier.is_equal ("ROOT") or
													a_classifier.is_equal ("DEFERRED") or
													a_classifier.is_equal ("EFFECTIVE"))
		do
			my_classifier := a_classifier.twin
		ensure
			equal (classifier, a_classifier)
		end

	set_generics (some_generics: FORMAL_GENERIC_LIST)
			-- The generic parameters of `Current'.
		do
			my_generics := some_generics.twin
		ensure
			equal (generics, some_generics)
		end

	set_reused (a_reused_flag: BOOLEAN)
			-- Set the reused flag of `Current'.
		do
			my_reused_flag := a_reused_flag
		ensure
			reused = a_reused_flag
		end

	set_persistent (a_persistent_flag: BOOLEAN)
			-- Set the persistent flag of `Current'.
		do
			my_persistent_flag := a_persistent_flag
		ensure
			persistent = a_persistent_flag
		end

	set_interfaced (a_interfaced_flag: BOOLEAN)
			-- Set the interfaced flag of `Current'.
		do
			my_interfaced_flag := a_interfaced_flag
		ensure
			interfaced = a_interfaced_flag
		end

	set_class_interface (a_class_interface: CLASS_INTERFACE)
			-- Set the class interfaces of `Current'.
		do
			my_class_interface := a_class_interface.twin
		ensure
			a_class_interface /= Void implies
				class_interface.is_equal (a_class_interface)
		end


feature -- Duplication

	copy (other: like Current)
		do
			check false end
		end

feature -- Removal

feature -- Resizing

feature -- Transformation

	canonicalize: like Current
			-- Rewrite `Current' into canonical form.
		do
			check false end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := is_equal_component (other) and is_equal (other) and
				equal (my_classifier, other.my_classifier) and
				equal (my_generics, other.my_generics) and
				equal (my_reused_flag, other.my_reused_flag) and
				equal (my_persistent_flag, other.my_persistent_flag) and
				equal (my_interfaced_flag, other.my_interfaced_flag)
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

feature {CLASS_SPECIFICATION} -- Implementation

	my_classifier: STRING
	my_generics: FORMAL_GENERIC_LIST
	my_reused_flag: BOOLEAN
	my_persistent_flag: BOOLEAN
	my_interfaced_flag: BOOLEAN
	my_class_interface: CLASS_INTERFACE

invariant
	my_classifier /= Void implies (classifier.is_equal ("ROOT") or
										 classifier.is_equal ("DEFERRED") or
										 classifier.is_equal ("EFFECTIVE"))

end -- class CLASS_SPECIFICATION
