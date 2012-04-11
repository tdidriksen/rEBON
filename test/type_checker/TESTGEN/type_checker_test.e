note

	description: "Test harness root class"
	generator: "getest version 3.9"

class TYPE_CHECKER_TEST

inherit

	TS_TESTER
		redefine
			build_suite
		end

create

	make, make_default

feature -- Element change

	build_suite
			-- Add to `suite' the test cases that need to executed.
		local
			l_regexp: like enabled_test_cases
			l_name: STRING
			l_test1: TEST_CLUSTER_CHART
		do
			l_regexp := enabled_test_cases
			l_name := "TEST_CLUSTER_CHART.test_true"
			if l_regexp = Void or else l_regexp.recognizes (l_name) then
				create l_test1.make_default
				l_test1.set_test (l_name, agent l_test1.test_true)
				put_test (l_test1)
			end
		end

end
