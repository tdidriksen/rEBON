note
	description: "The name of an object."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OBJECT_NAME

create
	make

feature -- Initialize
	make (a_class_name, an_extended_id: STRING)
			-- Initialize `Current'.
		require
			a_class_name /= Void and then not a_class_name.is_empty
			an_extended_id /= Void implies not an_extended_id.is_empty
		do
			my_class_name := a_class_name.twin

			if an_extended_id /= Void then
				my_extended_id := an_extended_id.twin
			end
		ensure
			class_name.is_equal (a_class_name)
			an_extended_id /= Void implies extended_id.is_equal (an_extended_id)
		end

feature -- Access
	hash_code: INTEGER
		do
			Result := my_class_name.hash_code + my_extended_id.hash_code
		end

	class_name: STRING
			-- What is the class name of `Current'?
		do
			Result := my_class_name.twin
		end

	extended_id: STRING
			-- What is the extended ID of `Current'?
		do
			Result := my_extended_id.twin
		end

feature -- Status report
	has_extended_id: BOOLEAN
			-- Does `Current' have an extended ID?
		do
			Result := my_extended_id /= Void and then not my_extended_id.is_empty
		end

feature {NONE} -- Implementation
	my_class_name: STRING
	my_extended_id: STRING

invariant
	my_class_name /= Void and then not my_class_name.is_empty
	my_extended_id /= Void implies not my_extended_id.is_empty


end
