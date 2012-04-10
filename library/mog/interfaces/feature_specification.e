note
	description: "The complete specification of a single feature of a class."

class
	FEATURE_SPECIFICATION

inherit
	HASHABLE

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		do
			Result := 0
			from
				my_feature_name_list.start
			until
				my_feature_name_list.after
			loop
				Result := Result + my_feature_name_list.item_for_iteration.hash_code
				my_feature_name_list.forth
			end
		end

	feature_names: FEATURE_NAME_LIST
			-- What are the feature names of `Current'?
		do
			Result := my_feature_name_list.twin
		end

	feature_status: STRING
			-- What is the status of `Current'?
		do
			Result := my_feature_status.twin
		end

	type_mark: TYPE_MARK
			-- What is the type mark of `Current'?
		do
			Result := my_type_mark.twin
		end

	type: BON_TYPE
			-- What is the type of `Current'?
		do
			Result := my_type_information.twin
		end

	rename_clause: RENAMING
			-- What is the rename clause of `Current'?
		do
			Result := my_rename_clause.twin
		end

	comment: COMMENT
			-- What is the comment of `Current'?
		do
			Result := my_comment.twin
		end

	arguments: FEATURE_ARGUMENT_LIST
			-- What are the feature arguments of `Current'?
		do
			Result := my_arguments.twin
		end

feature {NONE} -- Implementation

	my_feature_status: STRING -- enumeration of deferred, effective, redefined
	my_feature_name_list: FEATURE_NAME_LIST
	my_type_mark: TYPE_MARK
	my_type_information: BON_TYPE
	my_rename_clause: RENAMING
	my_comment: COMMENT
	my_arguments: FEATURE_ARGUMENT_LIST
	my_contract: ANY

invariant
	my_feature_status /= Void implies (my_feature_status.is_equal ("DEFERRED") xor my_feature_status.is_equal ("EFFECTIVE") xor my_feature_status.is_equal ("REDEFINED"))
	my_feature_name_list /= Void and then not my_feature_name_list.is_empty

end -- class FEATURE_SPECIFICATION
