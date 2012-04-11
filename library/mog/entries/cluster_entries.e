note
	description: "A set of cluster entries."

class
	CLUSTER_ENTRIES

inherit
	MOG_SET [CLUSTER_ENTRY]

create
	make, make_set, make_optional_rest, make_optional_first,
	make_from_set, make_from_list

end -- class CLUSTER_ENTRIES
