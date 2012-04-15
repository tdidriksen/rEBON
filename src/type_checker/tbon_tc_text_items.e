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
	err_ancestor_does_not_exist (a_descendant_name, an_ancestor_name: STRING): STRING
		do
			Result := "Specified ancestor "
			Result.append_string (an_ancestor_name.string)
			Result.append_string (" of class ")
			Result.append_string (a_descendant_name.string)
			Result.append_string (" does not exist.")
		end

	err_class_already_in_cluster (a_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": a class is specified more than once.")
		end

	err_class_does_not_exist (a_name: STRING): STRING
			-- Error message for when a class does not exist.
		do
			Result := "Class "
			Result.append_string (a_name.string)
			Result.append_string (" was specified, but never defined.")
		end

	err_class_exists (a_name: STRING): STRING
			-- Error message for when a class is defined more than once.
		do
			Result := "Error defining class "
			Result.append_string (a_name.string)
			Result.append_string (": name already exists. Please check that all your elements have distinct names.")
		end

	err_class_inherits_from_itself (a_descendant_name, an_ancestor_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_descendant_name.string)
			Result.append_string (" inherits from itself via class ")
			Result.append_string (an_ancestor_name.string)
		end

	err_class_not_in_cluster (a_name: STRING): STRING
		do
			Result := "Class "
			Result.append_string (a_name.string)
			Result.append_string (" is not in a cluster.")
		end

	err_cluster_already_in_cluster (a_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": a subcluster is specified more than once.")
		end

	err_cluster_already_in_system_chart (a_name: STRING): STRING
		do
			Result := "Error specifying cluster "
			Result.append_string (a_name.string)
			Result.append_string (": cluster is already in a system chart.")
		end

	err_cluster_does_not_exist (a_name: STRING): STRING
			-- Error message for when a cluster does not exist.
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" was specified, but never defined.")
		end

	err_cluster_exists (a_name: STRING): STRING
			-- Error message for when a cluster already exists
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": name already exists. Please check that all your elements have distinct names.")
		end

	err_cluster_contains_itself (a_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_name.string)
			Result.append_string (": cluster is a subcluster of itself.")
		end

	err_cluster_in_both_cluster_and_system (a_name: STRING): STRING
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" is both in a system chart and is a subcluster of a cluster.")
		end

	err_cluster_not_in_cluster_or_system (a_name: STRING): STRING
		do
			Result := "Cluster "
			Result.append_string (a_name.string)
			Result.append_string (" is not in a system chart and is not a subcluster of any cluster.")
		end

	err_creator_does_not_exist (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Specified creator class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (" does not exist.")
		end

	err_involved_class_does_not_exist (a_chart_name, an_entry_name, a_class_name: STRING): STRING
		do
			Result := "Specified class "
			Result.append_string (a_class_name.string)
			Result.append_string (" does not exist in event entry ")
			Result.append_string (an_entry_name.string)
			Result.append_string (" in event chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	err_target_does_not_exist (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Specified target class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (" does not exist.")
		end

	err_undefined (a_description: STRING): STRING
		do
			Result := "Undefined error: "
			Result.append_string (a_description.string)
		end

feature -- Warnings

	warn_duplicate_creation_entry (a_chart_name, a_class_name: STRING): STRING
		do
			Result := "Duplicate entries for creation involving creator class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in creation chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	warn_duplicate_event_entry (a_chart_name, a_name: STRING): STRING
		do
			Result := "Duplicate entries for event "
			Result.append_string (a_name.string)
			Result.append_string (" in event chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

	warn_duplicate_scenario_entry (a_chart_name, a_name: STRING): STRING
		do
			Result := "Duplicate entries for scenario "
			Result.append_string (a_name.string)
			Result.append_string (" in scenario chart ")
			Result.append_string (a_chart_name.string)
			Result.append_string (".")
		end

end
