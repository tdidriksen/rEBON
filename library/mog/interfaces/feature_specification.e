note
	description: "The complete specification of a single feature of a class."

class
	FEATURE_SPECIFICATION

inherit
	HASHABLE

create
	make

feature -- Initialization
	make (a_feature_status: STRING
			some_feature_names: FEATURE_NAME_LIST
			a_type: BON_TYPE
			a_rename_clause: RENAMING
			a_comment: COMMENT
			some_feature_arguments: FEATURE_ARGUMENT_LIST
			a_contract_clause: CONTRACT_CLAUSE)
			-- Initialize `Current'.
		require
			a_feature_status /= Void implies
				a_feature_status.is_equal ("DEFERRED") xor
				a_feature_status.is_equal ("EFFECTIVE") xor
				a_feature_status.is_equal ("REDEFINED")

			some_feature_names /= Void and then not some_feature_names.is_empty
		do
			if a_feature_status /= Void then
				my_feature_status := a_feature_status.twin
			end
			
			my_feature_name_list := some_feature_names.twin

			if a_type /= Void then
				my_type_information := a_type.twin
			end

			if a_rename_clause /= Void then
				my_rename_clause := a_rename_clause.twin
			end

			if a_comment /= Void then
				my_comment := a_comment.twin
			end

			if some_feature_arguments /= Void then
				my_arguments := some_feature_arguments.twin
			end

			if a_contract_clause /= Void then
				my_contracts := a_contract_clause.twin
			end
		ensure
			feature_status.is_equal (a_feature_status)
			equal (feature_names, some_feature_names)
			a_type /= Void implies equal (type, a_type)
			a_rename_clause /= Void implies equal (rename_clause, a_rename_clause)
			a_comment /= Void implies equal (comment, a_comment)
			some_feature_arguments /= Void implies equal (arguments, some_feature_arguments)
			a_contract_clause /= Void implies equal (contracts, a_contract_clause)
		end

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

	contracts: CONTRACT_CLAUSE
			-- What are the feature arguments of `Current'?
		do
			Result := my_contracts.twin
		end

feature -- Status report
	has_status: BOOLEAN
			-- Does `Current' have a status?
		do
			Result := my_feature_status /= Void and then not my_feature_status.is_empty
		end

	has_type: BOOLEAN
			-- Does `Current' have a type?
		do
			Result := my_type_information /= Void
		end

	has_rename_clause: BOOLEAN
			-- Does `Current' have a rename clause?
		do
			Result := my_rename_clause /= Void
		end

	has_arguments: BOOLEAN
			-- Does `Current' have a arguments?
		do
			Result := my_arguments /= Void and then not my_arguments.is_empty
		end

	has_contract: BOOLEAN
			-- Does `Current' have a contracts?
		do
			Result := my_contracts /= Void
		end

	is_deferred: BOOLEAN
			-- Is `Current' deferred?
		do
			Result := has_status and my_feature_status ~ "DEFERRED"
		end

	is_effective: BOOLEAN
			-- Is `Current' effective?
		do
			Result := has_status and my_feature_status ~ "EFFECTIVE"
		end

	is_redefined: BOOLEAN
			-- Is `Current' redefined?
		do
			Result := has_status and my_feature_status ~ "REDEFINED"
		end

feature {NONE} -- Implementation

	my_feature_status: STRING -- enumeration of deferred, effective, redefined
	my_feature_name_list: FEATURE_NAME_LIST
	my_type_information: BON_TYPE
	my_rename_clause: RENAMING
	my_comment: COMMENT
	my_arguments: FEATURE_ARGUMENT_LIST
	my_contracts: CONTRACT_CLAUSE

invariant
	my_feature_status /= Void implies (my_feature_status.is_equal ("DEFERRED") xor my_feature_status.is_equal ("EFFECTIVE") xor my_feature_status.is_equal ("REDEFINED"))
	my_feature_name_list /= Void and then not my_feature_name_list.is_empty
	my_arguments /= Void implies not my_arguments.is_empty
	my_contracts /= Void implies (my_contracts.has_precondition or my_contracts.has_postcondition)

end -- class FEATURE_SPECIFICATION
