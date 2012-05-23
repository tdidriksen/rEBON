note
	description: "Sequences where values can be updated."
	author: "Nadia Polikarpova"
	date: "$Date$"
	revision: "$Revision$"
	model: map

deferred class
	V_MUTABLE_SEQUENCE [G]

inherit
	V_SEQUENCE [G]
		redefine
			item
		end

feature -- Access
	item alias "[]" (i: INTEGER): G assign put
			-- Value at position `i'.
		deferred
		end

feature -- Iteration
	at (i: INTEGER): V_MUTABLE_SEQUENCE_ITERATOR [G]
			-- New iterator pointing at position `i'.
		deferred
		end

feature -- Replacement
	put (v: G; i: INTEGER)
			-- Replace value at position `i' with `v'.
		require
			has_index: has_index (i)
		do
			at (i).put (v)
		ensure
			map_effect: map |=| old map.updated (i, v)
		end

	swap (i1, i2: INTEGER)
			-- Swap values at positions `i1' and `i2'.
		require
			has_index_one: has_index (i1)
			has_index_two: has_index (i2)
		local
			it1, it2: V_IO_ITERATOR [G]
			v: G
		do
			it1 := at (i1)
			it2 := at (i2)
			v := it1.item
			it1.put (it2.item)
			it2.put (v)
		ensure
			map_effect: map |=| old map.updated (i1, map [i2]).updated (i2, map [i1])
		end

	fill (v: G; l, u: INTEGER)
			-- Put `v' at positions [`l', `u'].
		require
			l_not_too_small: l >= lower
			u_not_too_large: u <= upper
			l_not_too_large: l <= u + 1
		local
			it: V_IO_ITERATOR [G]
			j: INTEGER
		do
			from
				it := at (l)
				j := l
			until
				j > u
			loop
				it.put (v)
				it.forth
				j := j + 1
			end
		ensure
			map_domain_effect: map.domain |=| old map.domain
			map_changed_effect: (map | {MML_INTERVAL}[[l, u]]).is_constant (v)
			map_unchanged_effect: (map | (map.domain - {MML_INTERVAL}[[l, u]])) |=| old (map | (map.domain - {MML_INTERVAL}[[l, u]]))
		end

	clear (l, u: INTEGER)
			-- Put default value at positions [`l', `u'].
		require
			l_not_too_small: l >= lower
			u_not_too_large: u <= upper
			l_not_too_large: l <= u + 1
		do
			fill (({G}).default, l, u)
		ensure
			map_domain_effect: map.domain |=| old map.domain
			map_changed_effect: (map | {MML_INTERVAL}[[l, u]]).is_constant (({G}).default)
			map_unchanged_effect: (map | (map.domain - {MML_INTERVAL}[[l, u]])) |=| old (map | (map.domain - {MML_INTERVAL}[[l, u]]))
		end

	copy_range (other: V_SEQUENCE [G]; other_first, other_last, index: INTEGER)
			-- Copy items of `other' within bounds [`other_first', `other_last'] to current sequence starting at index `index'.
		require
			other_exists: other /= Void
			other_first_not_too_small: other_first >= other.lower
			other_last_not_too_large: other_last <= other.upper
			other_first_not_too_large: other_first <= other_last + 1
			index_not_too_small: index >= lower
			enough_space: upper - index >= other_last - other_first
		local
			other_it: V_ITERATOR [G]
			it: V_IO_ITERATOR [G]
			j, n: INTEGER
		do
			n := other_last - other_first + 1
			from
				j := 1
				other_it := other.at (other_first)
				it := at (index)
			until
				j > n
			loop
				it.put (other_it.item)
				other_it.forth
				it.forth
				j := j + 1
			end
		ensure
			map_domain_effect: map.domain |=| old map.domain
			map_changed_effect: {MML_INTERVAL} [[index, index + other_last - other_first]].for_all (
				agent (i: INTEGER; other_map: MML_MAP [INTEGER, G]; f, of: INTEGER): BOOLEAN
					do
						Result := map [i] = other_map [i - f + of]
					end (?, old other.map, index, other_first))
			map_unchanged_effect: (map | (map.domain - {MML_INTERVAL} [[index, index + other_last - other_first]])) |=|
				old (map | (map.domain - {MML_INTERVAL} [[index, index + other_last - other_first]]))
			other_map_effect: other /= Current implies other.map |=| old other.map
		end

	sort (order: PREDICATE [ANY, TUPLE [G, G]])
			-- Sort elements in `order' left to right.
		require
			order_exists: order /= Void
			order_has_two_args: order.open_count = 2
			--- order_is_total: order.precondition |=| True
			--- order_is_total_order: is_total_order (order)
		do
			quick_sort (lower, upper, order)
		ensure
			map_effect_short: map.count < 2 implies map |=| old map
			map_effect_long: map.count >= 2 implies
				bag |=| old bag and
				(map.domain / map.domain.extremum (agent greater_equal)).for_all (
					agent (i: INTEGER; o: PREDICATE [ANY, TUPLE [G, G]]): BOOLEAN
						do
							Result := o.item ([map [i], map [i + 1]])
						end (?, order))
		end

feature {NONE} -- Implementation
	quick_sort (left, right: INTEGER; order: PREDICATE [ANY, TUPLE [G, G]])
			-- Sort element in index range [`left', `right'] in `order' left to right.
		require
			in_range: right > left implies has_index (left) and has_index (right)
			order_exists: order /= Void
			order_has_two_args: order.open_count = 2
			--- is_total_order: is_total_order (order)
		local
			pivot, l, r: INTEGER
		do
			if right > left then
				from
					l := left
					r := right
					pivot := (left + right) // 2
				until
					l > pivot or r < pivot
				loop
					from
					until
						order.item ([item (pivot), item (l)]) or l > pivot
					loop
						l := l + 1
					end
					from
					until
						order.item ([item (r), item (pivot)]) or r < pivot
					loop
						r := r - 1
					end
					swap (l, r)
					l := l + 1
					r := r - 1
					if l - 1 = pivot then
						r := r + 1
						pivot := r
					elseif r + 1 = pivot then
						l := l - 1
						pivot := l
					end
				end
				quick_sort (left, pivot - 1, order)
				quick_sort (pivot + 1, right, order)
			end
		end
end
