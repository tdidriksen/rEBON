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
			bon_spec := bon_specification_from_file ("informal_bon/system_chart_empty.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
		end

    test_system_chart_non_existing_cluster
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/system_chart_non_existing_cluster.bon")
			assert_false ("Type checking fails because of non-existing cluster", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster does not exist", error_occurred (err_code_cluster_does_not_exist))
		end

    test_system_chart_clusters_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/system_chart_clusters_exist.bon")
			assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
		end

feature -- Test, class dictionaries
    test_class_dictionary_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/class_dictionary_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_class_dictionary_class_not_defined
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_dictionary_class_not_defined.bon")
			assert_false ("Type checking fails because class is not defined", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

    test_class_dictionary_cluster_not_defined
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_dictionary_cluster_not_defined.bon")
			assert_false ("Type checking fails because cluster is not defined", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster does not exist", error_occurred (err_code_cluster_does_not_exist))
		end

feature -- Test, cluster charts
    test_cluster_chart_duplicate_cluster_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_duplicate_cluster_name.bon")
			assert_false ("Type checking fails because cluster name already exists", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: cluster name already exists", error_occurred (err_code_cluster_exists))
		end

    test_cluster_chart_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		if attached {TBON_TC_CLUSTER_TYPE} type_checker.type_with_name ("TEST_CLUSTER", type_checker.informal_type_context) as l_cluster then
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
			bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_non_existing_class.bon")
			assert_false ("Type checking fails because of non-existing class", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_class_does_not_exist))
		end

    test_cluster_chart_non_existing_cluster
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_non_existing_cluster.bon")
			assert_false ("Type checking fails because of non-existing cluster", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class does not exist", error_occurred (err_code_cluster_does_not_exist))
		end

--    test_cluster_chart_subcluster_of_self
--		local
--			bon_spec: BON_SPECIFICATION
--		do
--			set_up_test
--			bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_subcluster_of_self.bon")
--			assert_false ("Type checking fails because cluster is subcluster of itself", type_checker.check_bon_specification (bon_spec))
--		    assert ("Error: cluster is subcluster of itself", error_occurred (err_code_cluster_contains_itself))
--		end

--    test_cluster_chart_subcluster_of_self_nested
--		local
--			bon_spec: BON_SPECIFICATION
--		do
--			set_up_test
--			bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_subcluster_of_self_nested.bon")
--			assert_false ("Type checking fails because cluster is subcluster of itself", type_checker.check_bon_specification (bon_spec))
--		    assert ("Error: cluster is subcluster of itself", error_occurred (err_code_cluster_contains_itself))
--		end

feature -- Test, class charts
    test_class_chart_duplicate_class_name
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_chart_duplicate_class_name.bon")
			assert_false ("Type checking fails because of duplicate class name", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: duplicate class name", error_occurred (err_code_class_exists))
		end

    test_class_chart_with_ancestors
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/class_chart_with_ancestors.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		if attached {TBON_TC_CLASS_TYPE} type_checker.type_with_name ("CLASS_THREE", type_checker.informal_type_context) as l_class then
    		    assert("CLASS_ONE is an ancestor", l_class.ancestors.exists (
    		        agent (l_type: TBON_TC_CLASS_TYPE): BOOLEAN
    		            do
    		                Result := l_type.name.is_equal ("CLASS_ONE")
    		            end
    		    ))
    		    assert("CLASS_TWO is an ancestor", l_class.ancestors.exists (
    		        agent (l_type: TBON_TC_CLASS_TYPE): BOOLEAN
    		            do
    		                Result := l_type.name.is_equal ("CLASS_TWO")
    		            end
    		    ))
    		else
    		    assert ("Class did not exist", False)
    		end
    	end

    test_class_chart_ancestor_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_chart_ancestor_does_not_exist.bon")
			assert_false ("Type checking fails because ancestors does not exist", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: ancestor does not exist", error_occurred (err_code_ancestor_does_not_exist))
		end

    test_class_chart_inherits_from_itself
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_chart_inherits_from_itself.bon")
			assert_false ("Type checking fails because class inherits from itself", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: class inherits from itself", error_occurred (err_code_class_inherits_from_itself))
		end

    test_class_chart_circular_inheritance
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("informal_bon/class_chart_circular_inheritance.bon")
			assert_false ("Type checking fails because of circular inheritance", type_checker.check_bon_specification (bon_spec))
		    assert ("Error: circular inheritance", error_occurred (err_code_class_inherits_from_itself))
		end

feature -- Test, event charts

    test_event_chart_empty
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/event_chart_empty.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_event_chart_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/event_chart_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_event_chart_duplicate_entry
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/event_chart_duplicate_entry.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		assert ("Warning: duplicate event entry", warning_occurred(warn_code_duplicate_event_entry))
    	end

     test_event_chart_involved_class_does_not_exist
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/event_chart_involved_class_does_not_exist.bon")
    		assert_false ("Type checking fails because involved class does not exist", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: involved class does not exist", error_occurred(err_code_involved_class_does_not_exist))
    	end

feature -- Test, scenario charts
    test_scenario_chart_empty
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/scenario_chart_empty.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_scenario_chart_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/scenario_chart_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_scenario_chart_duplicate_entry
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/scenario_chart_duplicate_scenario_entry.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		assert ("Warning: duplicate scenario entry", warning_occurred(warn_code_duplicate_scenario_entry))
    	end


feature -- Test, creation charts
    test_creation_chart_empty
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/creation_chart_empty.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

    test_creation_chart_positive
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/creation_chart_positive.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    	end

     test_creation_chart_creator_does_not_exist
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/creation_chart_creator_does_not_exist.bon")
    		assert_false ("Type checking fails because creator class does not exist", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: creator class does not exist", error_occurred(err_code_creator_does_not_exist))
    	end

     test_creation_chart_target_does_not_exist
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/creation_chart_target_does_not_exist.bon")
    		assert_false ("Type checking fails because target class does not exist", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: creator class does not exist", error_occurred(err_code_target_does_not_exist))
    	end

    test_creation_chart_duplicate_entry
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/creation_chart_duplicate_entry.bon")
    		assert ("Type checking succeeds", type_checker.check_bon_specification (bon_spec))
    		assert ("Warning: duplicate creation entry", warning_occurred(warn_code_duplicate_creation_entry))
    	end

feature -- Test, structure
     test_cluster_in_more_than_one_cluster
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_in_more_than_one_cluster.bon")
    		assert_false ("Type checking fails because cluster is in more than one cluster", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: cluster is in more than one cluster", error_occurred(err_code_cluster_already_in_cluster))
    	end

     test_cluster_in_both_cluster_and_system_chart
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_in_cluster_and_system_chart.bon")
    		assert_false ("Type checking fails because cluster is in both a cluster and a system chart", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: cluster is in both a cluster and a system chart", error_occurred(err_code_cluster_in_both_cluster_and_system))
    	end

     test_cluster_not_in_cluster_or_system
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/cluster_chart_not_in_cluster_or_system_chart.bon")
    		assert_false ("Type checking fails because cluster is neither in a system chart nor in a cluster chart", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: cluster is neither in system chart or cluster chart", error_occurred(err_code_cluster_not_in_cluster_or_system))
    	end

     test_class_in_more_than_one_cluster
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/class_chart_in_more_than_one_cluster.bon")
    		assert_false ("Type checking fails because class is in more than one cluster", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: class is in more than one cluster", error_occurred(err_code_class_already_in_cluster))
    	end

     test_class_not_in_a_cluster
    	local
    		bon_spec: BON_SPECIFICATION
    	do
    		set_up_test
    		bon_spec := bon_specification_from_file ("informal_bon/class_chart_not_in_a_cluster.bon")
    		assert_false ("Type checking fails because class is not in a cluster", type_checker.check_bon_specification (bon_spec))
    		assert ("Error: class is not in a cluster", error_occurred(err_code_class_not_in_cluster))
    	end
end
