note
	description: "A renaming of a feature."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RENAMING

create
	make

feature -- Initialization
	make (a_class_name: STRING; a_feature_name: FEATURE_NAME)
			-- Initialize `Current'.
		require
			a_class_name /= Void and then not a_class_name.is_empty
			a_feature_name /= Void
		do
			my_class_name := a_class_name.twin
			my_feature_name := a_feature_name.twin
		ensure
			class_name.is_equal (a_class_name)
			equal (a_feature_name, feature_name)
		end

feature -- Access
	class_name: STRING
			-- What is the class name of `Current'?

	feature_name: FEATURE_NAME
			-- What is the feature name of `Current'?

feature {NONE} -- Implementation
	my_class_name: STRING
	my_feature_name: FEATURE_NAME

invariant
	my_class_name /= Void and then not my_class_name.is_empty
	my_feature_name /= Void

end
