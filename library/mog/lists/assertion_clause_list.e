note
	description: "A list of assertion clauses."
	author: ""
	date: "$Date: 2005/05/02 22:58:30 $"
	revision: "$Revision: 1.1 $"

class
	ASSERTION_CLAUSE_LIST

inherit
	MOG_LIST [ASSERTION_CLAUSE]

create
	make_list, make_optional_rest, make_optional_first

end -- class ASSERTION_CLAUSE_LIST
