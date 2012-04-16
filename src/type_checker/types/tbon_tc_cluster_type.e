note
	description: "A cluster type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_CLUSTER_TYPE

inherit
	TBON_TC_TYPE

create
	make

feature -- Initialization
	make (a_name: STRING)
			-- Create a cluster type for type checking.
		do
			name := a_name
			create types.default_create
			is_reused := False
		end

feature -- Access
	types: MML_SET[TBON_TC_TYPE]
			-- Which class types are contained in this cluster?

	parent: TBON_TC_CLUSTER_TYPE
			-- What cluster is this cluster in?
			-- Void if none

feature -- Element change
	add_type (a_type: TBON_TC_TYPE)
			-- Add `a_type' to `types'.
		require
			not_void: a_type /= Void
		do
			types := types & a_type
		end

	set_is_in_system_chart
			-- Set `is_in_system_chart' to True.
		do
			is_in_system_chart := True
		ensure
			is_in_system_chart: is_in_system_chart
		end

	set_is_reused
			-- Set `is_reused' to True.
		do
			is_reused := True
		ensure
			is_reused: is_reused
		end

	set_parent (a_cluster: TBON_TC_CLUSTER_TYPE)
			-- Set `a_cluster' to be the parent of cluster of `Current'.
		require
			not_void: a_cluster /= Void
		do
			parent := a_cluster
		end

feature -- Status report
	is_in_system_chart: BOOLEAN
			-- Is `Current' in a system chart?

	is_reused: BOOLEAN
			-- Is `Current' reused?

	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		do
			Result := False
		end

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name
		end

end
