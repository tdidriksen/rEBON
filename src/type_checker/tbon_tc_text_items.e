note
	description: "Text items for a textual BON type checker."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_TEXT_ITEMS

feature -- Type names
	any_type_name: STRING = "ANY"
			-- Type name for an ANY type.

	boolean_type_name: STRING = "BOOLEAN"
			-- Type name for a BOOLEAN type.

	character_type_name: STRING = "CHARACTER"
			-- Type name for a CHARACTER type.

	integer_type_name: STRING = "INTEGER"
			-- Type name for an INTEGER type.

	none_type_name: STRING = "NONE"
			-- Type name for a NONE type.

	real_type_name: STRING = "REAL"
			-- Type name for a REAL type.

	string_type_name: STRING = "STRING"
			-- Type name for a STRING type.

feature -- Error messages
	err_actual_type_does_not_match_bounding_type (a_generic_name, an_actual_type: STRING): STRING
		do
			Result := "Type "
			Result.append_string (an_actual_type.string)
			Result.append_string (" does not conform to bounding type of type parameter ")
			Result.append_string (a_generic_name.string)
			Result.append_string (".")
		end

	err_ancestor_does_not_exist (a_descendant_name, an_ancestor_name: STRING): STRING
		do
			Result := "Specified ancestor "
			Result.append_string (an_ancestor_name.string)
			Result.append_string (" of class ")
			Result.append_string (a_descendant_name.string)
			Result.append_string (" does not exist.")
		end

	err_argument_type_does_not_exist(an_argument_name, a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Type of argument "
			Result.append_string (an_argument_name.string)
			Result.append_string (" in feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" could not be found.")
		end

	err_argument_types_does_not_match_precursers(a_feature_name, a_precursor_feature_name, a_class_name: STRING): STRING
		do
			Result := "Types of arguments in redefined feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" does not match those of its precursor ")
			Result.append_string (a_precursor_feature_name)
			Result.append_string (".")
		end

	err_class_already_in_cluster (a_cluster_name, a_class_name, a_class_parent_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_cluster_name.string)
			Result.append_string (": class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is already in cluster ")
			Result.append_string (a_class_parent_name.string)
			Result.append_string (".")
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

	err_cluster_already_in_cluster (a_cluster_name, a_subcluster_name, a_subcluster_parent_name: STRING): STRING
		do
			Result := "Error defining cluster "
			Result.append_string (a_cluster_name.string)
			Result.append_string (": subcluster ")
			Result.append_string (a_subcluster_name.string)
			Result.append_string ("is already specified in cluster ")
			Result.append_string (a_subcluster_parent_name.string)
			Result.append_string (".")
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

	err_duplicate_argument_name (an_argument_name, a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Argument name "
			Result.append_string (an_argument_name.string)
			Result.append_string (" in feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name)
			Result.append_string (" is specified more than once.")
		end

	err_duplicate_feature_name (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature name "
			Result.append_string (a_feature_name.string)
			Result.append_string (" is specified more than once in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_duplicate_inherited_feature_name (a_feature_name: STRING; a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" appears in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" more than once due to inheritance of feature with the same name.")
		end

	err_enclosing_class_not_generic (a_feature_name, a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" specifies a generic name ")
			Result.append_string (a_generic_name.string)
			Result.append_string (", but class is not generic.")
		end

	err_feature_type_does_not_exist (a_feature_name, a_type_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" specifies type ")
			Result.append_string (a_type_name.string)
			Result.append_string (", but type does not exist.")
		end

	err_feature_argument_type_does_not_exist (a_feature_name, an_argument_name, a_type_name: STRING): STRING
		do
			Result := "Feature argument "
			Result.append_string (an_argument_name.string)
			Result.append_string (" of feature ")
			Result.append_string (a_feature_name.string)
			Result.append_string (" specifies type ")
			Result.append_string (a_type_name.string)
			Result.append_string (", but type does not exist.")
		end

	err_formal_generic_name_appears_more_than_once (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (" appears more than once in definition of class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
		end

	err_formal_generic_name_does_not_exist (a_feature_name, a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" specifies a generic name ")
			Result.append_string (a_generic_name.string)
			Result.append_string (", but the generic name does not exist.")
		end

	err_formal_generic_name_is_bounded_by_enclosing_class (a_generic_name, a_class_name: STRING): STRING
		do
			Result := "Formal generic name "
			Result.append_string (a_generic_name.string)
			Result.append_string (" is bounded by its enclosing class ")
			Result.append_string (a_class_name.string)
			Result.append_string (".")
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

	err_no_precursor_exists_for_feature (a_feature_name, a_class_name: STRING): STRING
		do
			Result := "Feature "
			Result.append_string (a_feature_name.string)
			Result.append_string (" in class ")
			Result.append_string (a_class_name.string)
			Result.append_string (" is declared as redefined or deferred, but has no precursor.")
		end

	err_number_of_type_parameters_do_not_match (a_class_name, other_class_name: STRING): STRING
		do
			Result := "The number of type parameters for classes "
			Result.append_string (a_class_name.string)
			Result.append_string (" and ")
			Result.append_string (other_class_name.string)
			Result.append_string (" do not match.")
		end

	err_selective_export_class_does_not_exist (a_class_name, an_enclosing_class_name: STRING): STRING
		do
			Result := "Specified selective export class "
			Result.append_string (a_class_name.string)
			Result.append_string (" in class specification ")
			Result.append_string (an_enclosing_class_name.string)
			Result.append_string (" does not exist.")
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

	warn_extended_id_exists (an_extended_id: STRING): STRING
		do
			Result := "A diagram with extended ID "
			Result.append_string (an_extended_id.string)
			Result := " is defined more than once."
		end

end
