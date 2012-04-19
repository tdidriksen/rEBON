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
			create features.default_create
			create generics.default_create
		end

feature -- Access
	ancestors: MML_SET[TBON_TC_CLASS_TYPE]
			-- What are the super types of this type?

	cluster: TBON_TC_CLUSTER_TYPE
			-- What cluster is this type in?

	generics: MML_SET[TBON_TC_GENERIC]
			-- What are the generics of this type?

	features: MML_SET[TBON_TC_FEATURE]

	feature_with_name (a_feature_name: STRING): TBON_TC_FEATURE
			-- Which of the features of `Current' has the name `a_feature_name'?
		local
			feature_set: like features
		do
			feature_set := features.filtered (
				agent (l_feature: TBON_TC_FEATURE; l_feature_name: STRING): BOOLEAN
					do
						Result := l_feature.name ~ l_feature_name
					end (?, a_feature_name)
			)
			Result := Void
			if not feature_set.is_empty then
				check feature_set.count = 1 end
				Result := feature_set.any_item
			end
		end

	interface: MML_SET[TBON_TC_FEATURE]
			-- What is the set of features that can be called on `Current'?
		local
			l_ancestors: like ancestors
			l_ancestor: TBON_TC_CLASS_TYPE

			l_features: like features
			l_feature: TBON_TC_FEATURE
		do
--			Result := features
--			from
--				l_ancestors := ancestors.twin
--			until
--				l_ancestors.is_empty
--			loop
--				l_ancestor := l_ancestors.any_item

--				l_features := l_ancestor.features.twin


--				l_ancestors := l_ancestors / l_ancestor
--			end
			-- TODO
		end

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
			Result := (not generics.is_empty) and then generics.exists (
							agent (generic: TBON_TC_GENERIC; other_formal_name: STRING): BOOLEAN
								do
									Result := generic.formal_generic_name ~ other_formal_name
								end (?, a_formal_generic_name)
						)
		end

	conforms_to (other: TBON_TC_TYPE): BOOLEAN
			-- Does `Current' conform to `other'?
		local
			l_ancestors: like Current.ancestors
		do
			if Current ~ other or other.name ~ any_type_name then -- @didriksen - changed from model equality to object equality, as generics have to match.
				Result := True
			elseif other.name ~ none_type_name then
				-- You can never conform to NONE
				Result := False
			elseif not attached {TBON_TC_CLUSTER_TYPE} other then
				l_ancestors := Current.ancestors
				Result := l_ancestors.exists (
										agent (type: TBON_TC_CLASS_TYPE; l_other: TBON_TC_TYPE): BOOLEAN
											do
												Result := type |=| l_other
											end (?, other)
										)
				if not Result then
					Result := l_ancestors.for_all (
											agent (type: TBON_TC_CLASS_TYPE; l_other: TBON_TC_TYPE): BOOLEAN
												do
													Result := type.conforms_to (l_other)
												end (?, other)
											)
				end
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
			-- Is this `Current' equal to `other'?
		do
			Result := name ~ other.name and then generics |=| other.generics
						-- If other class is a class type and has generics, both names and generics must be equal
						-- For all generics of Current, there must exist an equal generic in other.
		end

end
