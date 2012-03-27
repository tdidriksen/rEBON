note
	description: "A list of comments."

class
	COMMENT

inherit
	SPECIFICATION_ELEMENT
		redefine
			is_valid
		end

	STRING_LIST

create
	make_list, make_optional_rest, make_optional_first, make_from_list,
	make_from_linear

feature -- Access

	hash_code: INTEGER
		do
			Result := 0

			from
				start
			until
				after
			loop
				Result := (Result + item_for_iteration.hash_code)

				forth
			end
		end

feature -- Status report

	is_valid: BOOLEAN
		do
			check false end
		end

end -- class COMMENT
