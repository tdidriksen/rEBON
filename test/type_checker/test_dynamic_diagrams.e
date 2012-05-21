note
	description: "Tests for dynamic diagrams."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_DYNAMIC_DIAGRAMS

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

feature -- Test Scenario Description

	test_scenario_already_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_already_exists.bon")
			assert_false ("Type checking fails because a scenario is mentioned twice", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Duplicate scenarios", error_occurred (err_code_scenario_already_exists))
		end

	test_scenario_integer_range_positive
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_integer_range_positive.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
		end

	test_scenario_labeled_action_already_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_labeled_action_already_exists.bon")
			assert_false ("Type checking fails because two labeled actions has the same tag", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Duplicate labeled actions", error_occurred (err_code_labeled_action_already_exists_in_context))
		end

	test_scenario_positive
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_positive.bon")
			assert ("Type checking passes.", type_checker.check_bon_specification (bon_spec))
		end

feature -- Test Object Stack

	test_scenario_object_group_already_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_object_group_already_exists.bon")
			assert_false ("Type checking fails because object group already exists.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Duplicate object groups", error_occurred (err_code_object_group_already_exists))
		end

	test_scenario_object_already_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_object_already_exists.bon")
			assert_false ("Type checking fails because object already exists.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Duplicate objects", error_occurred (err_code_object_already_exists))
		end

	test_scenario_object_stack_already_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_object_stack_already_exists.bon")
			assert_false ("Type checking fails because object stack already exists.", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Duplicate object stacks", error_occurred (err_code_object_stack_already_exists))
		end

	test_scenario_object_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_integer_range_positive.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
			assert ("Object is in context", attached {TBON_TC_OBJECT} type_checker.dynamic_object_with_name ("FOOT"))
		end

	test_scenario_object_stack_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_integer_range_positive.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
			assert ("Object stack is in context", attached {TBON_TC_OBJECT} type_checker.dynamic_object_with_name ("GAS_PEDAL"))
		end

	test_scenario_object_group_exists
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_integer_range_positive.bon")
			assert ("Type checking passes", type_checker.check_bon_specification (bon_spec))
			if attached {TBON_TC_OBJECT_GROUP} type_checker.dynamic_object_with_name ("group") as object_group then
				assert("Object group has right components", object_group.components.has (type_checker.dynamic_object_with_name ("ENGINE")) and object_group.components.has (type_checker.dynamic_object_with_name ("WHEEL")))
			else
				assert ("Object group does not exist", False)
			end

		end

feature -- Test Message Relations

	test_scenario_message_receiver_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_message_receiver_does_not_exist.bon")
			assert_false ("Type checking fails because a specified receiver does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Receiver does not exist", error_occurred (err_code_object_does_not_exist))
		end

	test_scenario_message_caller_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_message_caller_does_not_exist.bon")
			assert_false ("Type checking fails because a specified caller does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Caller does not exist", error_occurred (err_code_object_does_not_exist))
		end

	test_scenario_message_label_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_message_label_does_not_exist.bon")
			assert_false ("Type checking fails because a message label does not exist", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Label does not exist", error_occurred (err_code_message_label_in_dynamic_reference_does_not_exist))
		end

	test_scenario_receiver_dynamic_ref_does_not_exist
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_receiver_dynamic_ref_does_not_exist.bon")
			assert_false ("Type checking fails because a dynamic reference is wrong", type_checker.check_bon_specification (bon_spec))
			assert ("Error: Dynamic reference incorrect", error_occurred (err_code_prefix_group_does_not_match_object_group))
		end

	test_scenario_message_relations_positive
		local
			bon_spec: BON_SPECIFICATION
		do
			set_up_test
			bon_spec := bon_specification_from_file ("dynamic_diagram/scenario_message_relations_positive.bon")
			assert ("Type checking passes.", type_checker.check_bon_specification (bon_spec))
		end
end
