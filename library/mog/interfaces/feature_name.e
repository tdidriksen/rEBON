note
	description: "A feature name."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEATURE_NAME

inherit
	HASHABLE

create
	make_feature_name, make_infix, make_prefix

feature -- Initialization
	make_feature_name (a_feature_name: STRING)
			-- Initialize `Current' as a feature name described by an identifier.
		require
			a_feature_name /= Void
		do
			my_feature_name := a_feature_name.twin
		ensure
			feature_name.is_equal (a_feature_name)
		end

	make_infix (an_operator: OPERATOR)
			-- Initialize `Current' as an infix feature.
		do
			is_infix := True
			my_operator := an_operator.twin
		ensure
			equal (an_operator, operator)
		end

	make_prefix (an_operator: OPERATOR)
			-- Initialize `Current' as a prefix feature.
		do
			is_prefix := True
			my_operator := an_operator.twin
		ensure
			equal (an_operator, operator)
		end

feature -- Access
	feature_name: STRING
			-- Feature name of `Current'.
		do
			if my_feature_name /= Void then
				Result := my_feature_name.twin
			elseif is_infix or is_prefix then
				Result := operator.string_representation
			end
		end

	operator: OPERATOR
			-- The operator of `Current'.
		do
			Result := my_operator.twin
		end

	is_infix: BOOLEAN
			-- Is `Current' an infix operator?

	is_prefix: BOOLEAN
			-- Is `Current' a prefix operator?

	hash_code: INTEGER
		do
			Result := 0
			if my_feature_name /= Void then
				Result := Result + my_feature_name.hash_code
			end
			if my_operator /= Void then
				Result := Result + my_operator.string_representation.count
			end
		end

feature {NONE} -- Implementation

	my_feature_name: STRING
	my_operator: OPERATOR

invariant
	my_feature_name /= Void xor is_infix xor is_prefix
	is_infix implies (my_operator /= Void)
	is_prefix implies (my_operator /= Void)

end
