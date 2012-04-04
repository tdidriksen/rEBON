note
	description: "A relation between a variable and a type. Used for type checking."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_VARIABLE_TYPE_RELATION

create
	make

feature -- Initialization
	make (a_var_name: attached STRING; a_type: attached TBON_TC_TYPE; a_value: ANY)
			-- Create a variable-type relation
		do
			variable_name := a_var_name
			type := a_type
			variable_value := a_value
		end

feature -- Access
	variable_name: attached STRING
			-- What is the name of the variable in this relation?

	type: attached TBON_TC_TYPE
			-- What is the type of the variable in this relation?

	variable_value: ANY
			-- What is the value associated with the variable?

invariant
	relation_must_have_variable: variable_name /= Void and then not variable_name.is_empty
	relation_must_have_type: type /= Void

end
