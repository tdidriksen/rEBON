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

	err_code_ancestor_does_not_exist,
	err_code_class_already_in_cluster,
	err_code_class_does_not_exist,
	err_code_class_exists,
	err_code_class_inherits_from_itself,
	err_code_class_not_in_cluster,
	err_code_cluster_already_in_cluster,
	err_code_cluster_already_in_system_chart,
	err_code_cluster_does_not_exist,
	err_code_cluster_exists,
	err_code_cluster_contains_itself,
	err_code_cluster_in_both_cluster_and_system,
	err_code_cluster_not_in_cluster_or_system,
	err_code_creator_does_not_exist,
	err_code_involved_class_does_not_exist,
	err_code_target_does_not_exist,
	err_code_undefined: INTEGER = unique

feature -- Status report

	is_equal (other: like Current): BOOLEAN
		do
			Result := code = other.code
		end


end
