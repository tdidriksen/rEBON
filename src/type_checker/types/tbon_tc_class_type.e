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
			create {LINKED_LIST[like Current]} instances.make
			create {ARRAYED_LIST[STRING]} seen_ancestors.make (10)
			seen_ancestors.compare_objects
		end

feature -- Access
	ancestors: MML_SET[TBON_TC_CLASS_TYPE]
			-- What are the super types of this type?

	cluster: TBON_TC_CLUSTER_TYPE
			-- What cluster is this type in?

	generics: MML_SEQUENCE[TBON_TC_GENERIC]
			-- What are the generics of this type?

	index_of_generic_name (a_formal_generic_name: STRING): INTEGER
			-- What is the index of `a_formal_generic_name' in `generics'?
		require
			has_generic_name (a_formal_generic_name)
		local
			i: INTEGER
		do
			Result := 0
			from
				i := 1
			until
				i > generics.count
			loop
				if generics[i].formal_generic_name ~ a_formal_generic_name then
					Result := i
				end
				i := i + 1
			end
		end

	features: MML_SET[TBON_TC_FEATURE]

	feature_with_name (a_feature_name: STRING; l_is_prefix, l_is_infix: BOOLEAN): TBON_TC_FEATURE
			-- Which of the features of `Current' has the name `a_feature_name'?
		local
			feature_set: like features
			l_feature: TBON_TC_FEATURE
		do
			from
				feature_set := features.twin
			until
				feature_set.is_empty
			loop
				l_feature := feature_set.any_item

				if  l_feature.name ~ a_feature_name and
					(l_feature.is_prefix implies l_is_prefix) and
					(l_feature.is_infix implies l_is_infix) then
					Result := l_feature
				end

				feature_set := feature_set / l_feature
			end
--			feature_set := features.filtered (
--				agent (l_feature: TBON_TC_FEATURE; l_feature_name: STRING; l_l_is_prefix, l_l_is_infix: BOOLEAN): BOOLEAN
--					do
--						Result := l_feature.name ~ l_feature_name and
--								  (l_l_is_prefix implies l_feature.is_prefix) and
--								  (l_l_is_infix implies l_feature.is_infix)
--					end (?, a_feature_name, l_is_prefix, l_is_infix)
--			)
--			Result := Void
--			if not feature_set.is_empty then
--				check feature_set.count = 1 end
--				Result := feature_set.any_item
--			end
		end

	interface_feature_with_name (a_feature_name: STRING; l_is_prefix, l_is_infix: BOOLEAN): TBON_TC_FEATURE
			-- Which of the features of `Current' has the name `a_feature_name'?
		local
			feature_set: like features
		do
			feature_set := interface.filtered (
				agent (l_feature: TBON_TC_FEATURE; l_feature_name: STRING; l_l_is_prefix, l_l_is_infix: BOOLEAN): BOOLEAN
					do
						Result := l_feature.name ~ l_feature_name and
								  (l_l_is_prefix implies l_feature.is_prefix) and
								  (l_l_is_infix implies l_feature.is_infix)
					end (?, a_feature_name, l_is_prefix, l_is_infix)
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
			tuple_set: like rec_interface
			tuple: TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER]
		do
			seen_ancestors.wipe_out
			create Result.default_create
			-- Call recursive implementation on empty set
			from
				tuple_set := rec_interface (create {MML_SET[TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER]]}.default_create, 0)
			until
				tuple_set.is_empty
			loop
				tuple := tuple_set.any_item

				Result := Result & tuple.first

				tuple_set := tuple_set / tuple
			end
		end

	new_instance: like Current
			-- Can I have a copy of the current class type registered as an instance?
		do
			Result := Current.deep_twin
			instances.extend (Result)
		ensure
			instances.count = old instances.count + 1
		end

feature {TBON_TC_GENERIC, TBON_TC_FEATURE} -- Access, restricted

	instances: LIST[like Current]

feature {TBON_TC_CLASS_TYPE} -- Implementation
	rec_interface (an_accumulator: like rec_interface; level: INTEGER): MML_SET[TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER]]
			-- What is the set of features that can be called on `Current' (recursive implementation)?
		require
			level >= 0
		local
			l_ancestors: like ancestors
			l_ancestor: TBON_TC_CLASS_TYPE
			unique_features: like features
			acc: like an_accumulator
			i: INTEGER
		do
			unique_features := features.filtered (
					agent (l_l_feature: TBON_TC_FEATURE; l_feature_set: MML_SET[TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER]]; current_level: INTEGER): BOOLEAN
						do
							Result := not l_feature_set.exists (
								agent (acc_tuple: TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER];
									   other_feature: TBON_TC_FEATURE;
									   l_current_level: INTEGER): BOOLEAN
									local
										acc_feature: TBON_TC_FEATURE
										acc_level: INTEGER
									do
										acc_feature := acc_tuple.first
										acc_level := acc_tuple.second
										-- If Result is True, l_l_feature will not be in unique_features
										-- acc_feature is in accumulator, other_feature is tested for inclusion
										Result := (acc_feature.name ~ other_feature.name) or else
											 	  (acc_feature.is_renamed implies acc_feature.inherited_name ~ other_feature.name)
										if Result then -- Names are equal
											if acc_level = l_current_level and not (acc_feature.inherited_name ~ other_feature.name) then
												Result := False
													-- If name and level is equal, include.
													-- Duplicate names will be found in type checker.
											elseif acc_level < l_current_level and
												   acc_feature.enclosing_class.conforms_to (other_feature.enclosing_class) then
												Result := True
													-- Never include a feature that is higher up
													-- in the same inheritance hierarchy than one we already know of.
											elseif acc_level < l_current_level then
												Result := False
													-- If two features have the same name,
													-- but are not part of the same inheritance hierarchy,
													-- they are in effect two different features.
											end
										end

									end (?, l_l_feature, current_level)
							)
						end (?, an_accumulator, level)
				)

			acc := an_accumulator
			from
				i := 1
			until
				i > unique_features.array.count
			loop
				acc := acc & (create {TBON_TC_TUPLE[TBON_TC_FEATURE, INTEGER]}.make (unique_features.array[i], level))
				i := i + 1
			end

			if ancestors.is_empty then
				Result := acc
			else
				Result := acc
				from
					l_ancestors := ancestors.twin
				until
					l_ancestors.is_empty
				loop
					l_ancestor := l_ancestors.any_item

					if not seen_ancestors.has (l_ancestor.name) then
						Result := Result + l_ancestor.rec_interface (acc, level + 1)
					end
					seen_ancestors.extend (l_ancestor.name)

					l_ancestors := l_ancestors / l_ancestor
				end
			end
		end

	seen_ancestors: LIST[STRING]

	has_actual_type: BOOLEAN
			-- Does any of the generics of `a_class' have an actual type?
		do
			Result := generics.range.exists (
				agent (l_generic: TBON_TC_GENERIC): BOOLEAN
					do
						Result := l_generic.has_actual_type
					end
			)
		end

feature -- Element change
	add_ancestor (a_class: TBON_TC_CLASS_TYPE)
			-- Add `a_class' to `ancestors'?
		require
			not_void: a_class /= Void
		do
			ancestors := ancestors & a_class
			instances.do_all (agent (instance, an_ancestor: like Current) do instance.add_ancestor (an_ancestor) end (?, a_class))
		end

	add_feature (a_feature: TBON_TC_FEATURE)
			-- Add `a_feature' to `features'?
		require
			not_void: a_feature /= Void
		do
			features := features & a_feature
			instances.do_all (agent (instance: like Current; l_feature: TBON_TC_FEATURE) do instance.add_feature (l_feature) end (?, a_feature))
		end

	add_type_parameter (a_generic: TBON_TC_GENERIC)
			-- Add `a_generic' to `generics'?
		require
			not_void: a_generic /= Void
		do
			generics := generics & a_generic
			instances.do_all (agent (instance: like Current; l_generic: TBON_TC_GENERIC) do instance.add_type_parameter (l_generic) end (?, a_generic))
		end

	set_cluster (a_cluster: TBON_TC_CLUSTER_TYPE)
			-- Set `Current' to be in cluster `a_cluster'?
		require
			not_void: a_cluster /= Void
		do
			cluster := a_cluster
			instances.do_all (agent (instance: like Current; l_cluster: TBON_TC_CLUSTER_TYPE) do instance.set_cluster (l_cluster) end (?, a_cluster))
		end

	set_is_root
			-- Set `is_root' to True.
		do
			is_root := True
			instances.do_all (agent (instance: like Current) do instance.set_is_root end)
		ensure
			is_root: is_root
		end

	set_is_deferred
			-- Set `is_deferred' to True.
		do
			is_deferred := True
			instances.do_all (agent (instance: like Current) do instance.set_is_deferred end)
		ensure
			is_deferred: is_deferred
		end

	set_is_effective
			-- Set `is_effective' to True.
		do
			is_effective := True
			instances.do_all (agent (instance: like Current) do instance.set_is_effective end)
		ensure
			is_effective: is_effective
		end

	set_is_reused
			-- Set `is_reused' to True.
		do
			is_reused := True
			instances.do_all (agent (instance: like Current) do instance.set_is_reused end)
		ensure
			is_reused: is_reused
		end

	set_is_persistent
			-- Set `is_persistent' to True.
		do
			is_persistent := True
			instances.do_all (agent (instance: like Current) do instance.set_is_persistent end)
		ensure
			is_persistent: is_persistent
		end

	set_is_interfaced
			-- Set `is_interfaced' to True.
		do
			is_interfaced := True
			instances.do_all (agent (instance: like Current) do instance.set_is_interfaced end)
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
			Result := (not generics.is_empty) and then generics.range.exists (
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
			Result := other.name ~ any_type_name
			if not Result then -- Only go on if other is not ANY
				if Current.name ~ other.name then
					Result := True
					if attached {TBON_TC_CLASS_TYPE} other as other_class then
						if Current.generics.count = other_class.generics.count then
							if Current.has_actual_type and other_class.has_actual_type then
								Result := Current.is_instance_equal (other_class)
							elseif Current.has_actual_type xor other_class.has_actual_type then
								Result := False
									-- If only one of the classes have actual types, they cannot be equal
							else
								Result := Current.generics |=| other_class.generics
							end
						else
							Result := False
						end
					else
						Result := False
					end
				elseif other.name ~ none_type_name then
					-- You can never conform to NONE
					Result := False
				elseif not attached {TBON_TC_CLUSTER_TYPE} other then
					l_ancestors := Current.ancestors
					Result := l_ancestors.exists (
											agent (type: TBON_TC_CLASS_TYPE; l_other: TBON_TC_TYPE): BOOLEAN
												do
													Result := type.conforms_to (l_other)
												end (?, other)
											)
				else
					Result := False
				end
			end
		end

	is_instance_equal (other: TBON_TC_CLASS_TYPE): BOOLEAN
			-- Is the `Current' instance equal to `other'? (actual types of generics must be equal)
		require
			Current.generics.count = other.generics.count
		local
			i: INTEGER
		do
			Result := True
			from
				i := 1
			until
				i > Current.generics.count
			loop
				if (Current.generics[i].has_actual_type and other.generics[i].has_actual_type) and then
					(Current.generics[i].actual_type.name ~ other.generics[i].actual_type.name) then
					if Current.generics[i].actual_type.generics.count = other.generics[i].actual_type.generics.count then
						Result := Result and Current.generics[i].actual_type.is_instance_equal (other.generics[i].actual_type)
					else
						Result := False
					end
				else
					Result := False
				end

				i := i + 1
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
