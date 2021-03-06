note
   description: "An enumeration."

class
   ENUMERATED_SET

inherit
   SET_EXPRESSION
   		undefine
   			copy,
   			is_equal
   		end

   MOG_SET[ENUMERATION_ELEMENT]

   CONSTANT
   	undefine
   		copy,
   		is_equal
   	end

create
	make, make_set, make_optional_rest, make_optional_first,
	make_from_set, make_from_list

feature -- Access
	hash_code: INTEGER
		do
			Result := 0
			from
				start
			until
				after
			loop
				Result := Result + item_for_iteration.hash_code
			end
		end

end -- class ENUMERATED_SET
