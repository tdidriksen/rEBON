note
	description: "Tests for informal charts."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_INFORMAL_CHARTS

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

feature -- Test, system charts
    test_system_chart_empty
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("system_chart_empty.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
		end

    test_system_chart_non_existing_cluster
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("system_chart_non_existing_cluster.bon")
			assert_false ("Type checking fails because of non-existing cluster", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster does not exist", error_occurred (err_code_cluster_does_not_exist))
		end

    test_system_chart_clusters_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("system_chart_clusters_exist.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
		end

feature -- Test, class dictionaries
    test_class_dictionary_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("class_dictionary_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_class_dictionary_class_not_defined
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("class_dictionary_class_not_defined.bon")
			assert_false ("Type checking fails because class is not defined", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

    test_class_dictionary_cluster_not_defined
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("class_dictionary_cluster_not_defined.bon")
			assert_false ("Type checking fails because cluster is not defined", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster does not exist", error_occurred (err_code_cluster_does_not_exist))
		end

feature -- Test, cluster charts
    test_cluster_chart_duplicate_cluster_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("cluster_chart_duplicate_cluster_name.bon")
			assert_false ("Type checking fails because cluster name already exists", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster name already exists", error_occurred (err_code_cluster_exists))
		end

    test_cluster_chart_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("cluster_chart_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		if attached {TBON_TC_CLUSTER_TYPE} type_checker.type_with_name ("TEST_CLUSTER", type_checker.formal_type_context) as l_cluster then
    		    assert("CLASS_ONE is a part of cluster", l_cluster.types.exists (
    		        agent (l_type: TBON_TC_TYPE): BOOLEAN
    		            do
    		                Result := l_type.name.is_equal ("CLASS_ONE")
    		            end
    		    ))
    		    assert("CLASS_TWO is a part of cluster", l_cluster.types.exists (
    		        agent (l_type: TBON_TC_TYPE): BOOLEAN
    		            do
    		                Result := l_type.name.is_equal ("CLASS_TWO")
    		            end
    		    ))
    		else
    		    assert ("Cluster did not exist", False)
    		end
    	end

    test_cluster_chart_non_existing_class
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("cluster_chart_non_existing_class.bon")
			assert_false ("Type checking fails because of non-existing class", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

    test_cluster_chart_non_existing_cluster
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("cluster_chart_non_existing_cluster.bon")
			assert_false ("Type checking fails because of non-existing cluster", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

    test_cluster_chart_subcluster_of_self
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("cluster_chart_non_existing_cluster.bon")
			assert_false ("Type checking fails because of non-existing cluster", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

feature -- Test, class charts

feature -- Test, event charts

feature -- Test, scenario charts

feature -- Test, creation charts

end
