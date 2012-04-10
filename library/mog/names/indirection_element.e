note
	description: "An indefinite or definite reference to a (possibly %
							% indirectly parameterized) class."

class
	INDIRECTION_ELEMENT

inherit
	HASHABLE

	ELIDED

creation
	make, make_ellipses, make_with_class_name, make_with_formal_generic_name

feature -- Initialization

	make (a_named_indirection: NAMED_INDIRECTION)
		require
			a_named_indirection /= Void
		do
			my_named_indirection := a_named_indirection.twin
		ensure
			named_indirection.is_equal (a_named_indirection)
		end

	make_with_class_name (a_class_name: STRING)
			-- Initialize with a class name.
		do
			my_class_name := a_class_name.twin
		end

	make_with_formal_generic_name (a_formal_generic_name: STRING)
			-- Initialize with a formal generic name.
		do
			my_formal_generic_name := a_formal_generic_name.twin
		end

feature -- Access

	named_indirection: NAMED_INDIRECTION
			-- The named indirection of this indirection element, or `Void' if
			-- one has not been set.
		do
			Result := my_named_indirection.twin
		end

	class_name: STRING
			-- The class name of the indirection element.
		do
			Result := my_class_name.twin
		end

	formal_generic_name: STRING
			-- The class name of the indirection element.
		do
			Result := my_formal_generic_name.twin
		end

	hash_code: INTEGER
		do
			if my_named_indirection /= Void then
				Result := my_named_indirection.hash_code
			else
				Result := 0
			end
		end

feature {INDIRECTION_ELEMENT} -- Implementation

	my_class_name: STRING
	my_formal_generic_name: STRING
	my_named_indirection: NAMED_INDIRECTION

invariant
	my_named_indirection /= Void xor my_class_name /= Void xor my_formal_generic_name /= Void xor ellipses

end -- class INDIRECTION_ELEMENT
