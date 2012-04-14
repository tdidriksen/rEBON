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

create
	make, make_set, make_optional_rest, make_optional_first,
	make_from_set, make_from_list

end -- class ENUMERATED_SET
