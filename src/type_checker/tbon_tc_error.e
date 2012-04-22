note
	description: "A type checking error for a textual BON type checker."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_ERROR

inherit
	ANY
		redefine
			is_equal
		end

create
	make

feature -- Initialization
	make (an_error_code: INTEGER; an_error_message: STRING)
			-- Initialize `Current'.
		do
			code := an_error_code
			if an_error_message /= Void then
				message := an_error_message.string
			end
		end

feature -- Access
	code: INTEGER
			-- What is the error code of `Current'?

	message: STRING
			-- What is the error message of `Current'?

feature -- Error codes

	err_code_ancestor_does_not_exist: INTEGER = 1
	err_code_argument_type_does_not_exist: INTEGER = 2
	err_code_argument_types_does_not_match_precursor: INTEGER = 3
	err_code_class_already_in_cluster: INTEGER = 4
	err_code_class_does_not_exist: INTEGER = 5
	err_code_class_exists: INTEGER = 6
	err_code_class_inherits_from_itself: INTEGER = 7
	err_code_class_not_in_cluster: INTEGER = 8
	err_code_cluster_already_in_cluster: INTEGER = 9
	err_code_cluster_already_in_system_chart: INTEGER = 10
	err_code_cluster_does_not_exist: INTEGER = 11
	err_code_cluster_exists: INTEGER = 12
	err_code_cluster_contains_itself: INTEGER = 13
	err_code_cluster_in_both_cluster_and_system: INTEGER = 14
	err_code_cluster_not_in_cluster_or_system: INTEGER = 15
	err_code_creator_does_not_exist: INTEGER = 16
	err_code_duplicate_argument_name: INTEGER = 17
	err_code_duplicate_feature_name: INTEGER = 18
	err_code_duplicate_inherited_feature_name: INTEGER = 19
	err_code_enclosing_class_not_generic: INTEGER = 20
	err_code_feature_argument_type_does_not_exist: INTEGER = 21
	err_code_feature_type_does_not_exist: INTEGER = 22
	err_code_formal_generic_name_appears_more_than_once: INTEGER = 23
	err_code_formal_generic_name_does_not_exist: INTEGER = 24
	err_code_involved_class_does_not_exist: INTEGER = 25
	err_code_no_precursor_exists_for_feature: INTEGER = 26
	err_code_selective_export_class_does_not_exist: INTEGER = 27
	err_code_target_does_not_exist: INTEGER = 28
	err_code_undefined: INTEGER = 29
	err_code_formal_generic_name_is_bounded_by_enclosing_class: INTEGER = 30
	err_code_number_of_type_parameters_do_not_match: INTEGER = 31
	err_code_actual_type_does_not_match_bounding_type: INTEGER = 32

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := code = other.code
		end


end
