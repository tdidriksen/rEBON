note
   description: "A quantification expression, call expression, operator %
               % expression, or constant expression."

deferred class
 	EXPRESSION

inherit
	HASHABLE
		select
			hash_code
		end

	ASSERTION_CLAUSE
		rename
			hash_code as assertion_hash_code
		end

	ENUMERATION_ELEMENT

end -- class EXPRESSION
