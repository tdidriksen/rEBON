note
	description: "Text items for a textual BON type checker."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TEXT_ITEMS

feature -- Type names
	boolean_type_name: STRING = "BOOLEAN"
			-- Type name for a BOOLEAN type.

	character_type_name: STRING = "CHARACTER"
			-- Type name for a CHARACTER type.

	integer_type_name: STRING = "INTEGER"
			-- Type name for an INTEGER type.

	real_type_name: STRING = "REAL"
			-- Type name for a REAL type.

	string_type_name: STRING = "STRING"
			-- Type name for a STRING type.

feature -- Error messages
	err_cluster_does_not_exist (a_name: STRING): STRING
		do
			Result := "Cluster "
			Result.append_string (a_name)
			Result.append_string (": was specificed, but never defined.")
		end

	err_cluster_exists (a_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_name)
			Result.append_string (": name already exists.")
		end


end
