note
	description: "Either a feature name, a supplier indirection, %
						 % or a parent indirection."
	author: "Joseph R. Kiniry <kiniry@kindsoftware.com>"
	date: "$Date: 2005/12/21 14:06:18 $"
	revision: "$Revision: 1.2 $"

class CLIENT_ENTITY

inherit
	HASHABLE

create
	make_undefined, make_feature, make_supplier, make_parent

feature -- Initialization

	make_undefined
			-- Initialize `Current' as an undefined client entity.
		once
			my_undefined := true
		ensure
			undefined
		end

	make_feature (a_feature_name: FEATURE_NAME)
			-- Initialize `Current' as a feature name.
		require
			a_feature_name /= Void
		do
			my_feature_name := a_feature_name.twin
		ensure
			feature_name.is_equal (a_feature_name)
		end

	make_supplier (a_supplier: SUPPLIER_INDIRECTION)
			--
		require
			a_supplier /= Void
		do
			my_supplier_indirection := a_supplier.twin
		ensure
			supplier_indirection.is_equal (a_supplier)
		end

	make_parent (a_parent: PARENT_INDIRECTION)
			--
		require
			a_parent /= Void
		do
			my_parent_indirection := a_parent.twin
		ensure
			parent_indirection.is_equal (a_parent)
		end

feature -- Access

	hash_code: INTEGER
		do
			if my_feature_name /= Void then
				Result := my_feature_name.hash_code
			elseif my_supplier_indirection /= Void then
				-- Result := my_supplier_indirection.hash_code
			end
		end

	feature_name: FEATURE_NAME
			-- The feature name of `Current'.
		do
			Result := my_feature_name.twin
		end

	supplier_indirection: SUPPLIER_INDIRECTION
			-- The supplier indirection of `Current'.
		do
			Result := my_supplier_indirection.twin
		end

	parent_indirection: PARENT_INDIRECTION
			-- The parent indirection of `Current'.
		do
			Result := my_parent_indirection.twin
		end

	undefined: BOOLEAN
			-- Is `Current' an undefined client entity?
		do
			Result := my_undefined
		end

feature -- Status report
	has_feature_name: BOOLEAN
		do
			Result := my_feature_name /= Void
		end

	has_supplier_indirection: BOOLEAN
		do
			Result := my_supplier_indirection /= Void
		end

	has_parent_indirection: BOOLEAN
		do
			Result := my_parent_indirection /= Void
		end

feature {CLIENT_ENTITY} -- Implementation

	my_feature_name: FEATURE_NAME
	my_supplier_indirection: SUPPLIER_INDIRECTION
	my_parent_indirection: PARENT_INDIRECTION
	my_undefined: BOOLEAN

invariant

	(my_feature_name /= Void and then not my_feature_name.feature_name.is_empty) xor
	my_supplier_indirection /= Void xor
	my_parent_indirection /= Void xor
	my_undefined

end -- class CLIENT_ENTITY
