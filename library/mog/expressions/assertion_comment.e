note
	description: "Summary description for {ASSERTION_COMMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ASSERTION_COMMENT

inherit
	ASSERTION_CLAUSE
		rename
			hash_code as assertion_hash_code
		undefine
			copy,
			is_equal
		end

	COMMENT
		select
			hash_code
		end

create
	make_list, make_optional_rest, make_optional_first, make_from_list,
	make_from_linear

end
