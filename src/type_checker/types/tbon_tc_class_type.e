note
	description: "A class type for type checking of textual BON."
	author: "Sune Alkaersig <sual@itu.dk> and Thomas Didriksen <thdi@itu.dk>"
	date: "$Date$"
	revision: "$Revision$"

class
	TBON_TC_CLASS_TYPE

inherit
	TBON_TC_TYPE
		redefine
			is_model_equal,
			is_equal
		end

create
	make

feature -- Initialization
	make (a_name: STRING)
			-- Create a class type for type checking.
		do
			name := a_name
			create ancestors.default_create
		end

feature -- Access
	ancestors: MML_SET[TBON_TC_CLASS_TYPE]
			-- What are the super types of this type?

	cluster: TBON_TC_CLUSTER_TYPE
			-- What cluster is this type in?

	generics: MML_SET[TBON_TC_GENERIC]
			-- What are the generics of this type?

	features: MML_SET[TBON_TC_FEATURE]

feature -- Element change
	add_ancestor (a_class: TBON_TC_CLASS_TYPE)
			-- Add `a_class' to `ancestors'?
		require
			not_void: a_class /= Void
		do
			ancestors := ancestors & a_class
		end

	add_feature (a_feature: TBON_TC_FEATURE)
			-- Add `a_feature' to `features'?
		require
			not_void: a_feature /= Void
		do
			features := features & a_feature
		end

	set_cluster (a_cluster: TBON_TC_CLUSTER_TYPE)
			-- Set `Current' to be in cluster `a_cluster'?
		require
			not_void: a_cluster /= Void
		do
			cluster := a_cluster
		end

	set_is_root
			-- Set `is_root' to True.
		do
			is_root := True
		ensure
			is_root: is_root
		end

	set_is_deferred
			-- Set `is_deferred' to True.
		do
			is_deferred := True
		ensure
			is_deferred: is_deferred
		end

	set_is_effective
			-- Set `is_effective' to True.
		do
			is_effective := True
		ensure
			is_effective: is_effective
		end

	set_is_reused
			-- Set `is_reused' to True.
		do
			is_reused := True
		ensure
			is_reused: is_reused
		end

	set_is_persistent
			-- Set `is_persistent' to True.
		do
			is_persistent := True
		ensure
			is_persistent: is_persistent
		end

	set_is_interfaced
			-- Set `is_interfaced' to True.
		do
			is_interfaced := True
		ensure
			is_interfaced: is_interfaced
		end

feature -- Status report
	is_root: BOOLEAN
			-- Is `Current' a root class?

	is_deferred: BOOLEAN
			-- Is `Current' a deferred class?

	is_effective: BOOLEAN
			-- Is `Current' an effective class?

	is_reused: BOOLEAN
			-- Is `Current' a reused class?

	is_persistent: BOOLEAN
			-- Is `Current' a persistent class?

	is_interfaced: BOOLEAN
			-- Is `Current' an interfaced class?

	has_generic_name (a_formal_generic_name: STRING): BOOLEAN
			-- Is `a_formal_generic_name' one of the generic names of `Current'?
		do
			Result := generics /= Void and then generics.exists (
							agent (generic: TBON_TC_GENERIC; other_formal_name: STRING): BOOLEAN
								do
									Result := generic.formal_generic_name ~ other_formal_name
								end (?, a_formal_generic_name)
						)
		end

	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		local
			class_type: TBON_TC_CLASS_TYPE
		do
			class_type ?= other

			if class_type /= Void then

			else
				Result := False
			end
		end

	is_model_equal alias "|=|" (other: TBON_TC_TYPE): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name
		end

	is_equal (other: like Current): BOOLEAN
			-- Is this model mathematically equal to `other'?
		do
			Result := name ~ other.name and (generics /= Void implies generics.for_all (
												agent (generic: TBON_TC_GENERIC; l_other_class: TBON_TC_CLASS_TYPE): BOOLEAN
													do
														Result := l_other_class.generics.exists (agent (this_generic, other_generic: TBON_TC_GENERIC): BOOLEAN
																							do
																								Result := this_generic |=| (other_generic)
																							end (generic, ?)
																						)
													end (?, other)
											))
						-- If other class is a class type and has generics, both names and generics must be equal
						-- For all generics of Current, there must exist an equal generic in other.
		end

end
