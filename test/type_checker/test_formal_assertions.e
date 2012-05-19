note
	description: "Tests for formal assertions."
	author: "Sune Alkaersig <sual@itu.dk and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_FORMAL_ASSERTIONS

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


end
