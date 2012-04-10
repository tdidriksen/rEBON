note
	description: "A collection of features of a class."

class
	FEATURE_CLAUSE

inherit
	HASHABLE

create
	make

feature -- Initialization
	make (a_selective_export_list: CLASS_NAME_LIST; a_comment: COMMENT; some_feature_specifications: FEATURE_SPECIFICATION_LIST)
			-- Initialize `Current'.
		require
			some_feature_specifications /= Void
		do
			if a_selective_export_list /= Void then
				my_selective_exports := a_selective_export_list.twin
			end

			if a_comment /= Void then
				my_comment := a_comment.twin
			end

			my_feature_specifications := some_feature_specifications.twin
		ensure
			a_selective_export_list /= Void implies equal (a_selective_export_list, my_selective_exports)
			a_comment /= Void implies equal (a_comment, my_comment)
			feature_specifications /= Void and equal (some_feature_specifications, feature_specifications)
		end

feature -- Access

	hash_code: INTEGER
			-- Hash code of `Current'.
		do
				check false end
		end

	selective_export: CLASS_NAME_LIST
			-- The optional export list of this collection of features.
		do
			Result := my_selective_exports.twin
		end

	comment: COMMENT
			-- The optional comment applied to this collection of features.
		do
			Result := my_comment.twin
		end

	feature_specifications: FEATURE_SPECIFICATION_LIST
			-- Feature specifications of `Current'.
		do
			Result := my_feature_specifications.twin
		end

feature {NONE} -- Implementation

	my_selective_exports: CLASS_NAME_LIST
	my_comment: COMMENT
	my_feature_specifications: FEATURE_SPECIFICATION_LIST

invariant
	my_feature_specifications /= Void and not my_feature_specifications.is_empty

end -- class FEATURE_CLAUSE
