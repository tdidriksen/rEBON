note
	description: "Tests for cluster charts."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_CLUSTER_CHART

inherit
	TS_TEST_CASE
		undefine
			set_up
		end

	TBON_TC_TEST
		undefine
			is_equal
		end

create
	make_default

feature -- Test
	test_cluster_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("cluster_does_not_exist.bon")
			assert_false ("Type checking failed", type_checker.check_bon_specification (bon_spec))
			assert ("Cluster does not exist error occurred", error_occurred (err_code_cluster_does_not_exist))
		end

	test_success
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("class_chart.bon")
			assert ("Cluster chart succeeded", type_checker.check_bon_specification (bon_spec))
		end

end
