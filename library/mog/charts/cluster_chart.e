note
	description: "A cluster chart."

class
	CLUSTER_CHART

inherit
	INFORMAL_CHART
		redefine
			bon_out,
			canonicalize,
			copy, is_equal,
			is_part_of, contains, is_disjoint,
			merge, intersect, subtract, symdif,
			wipe_out
		end

creation
	make

feature -- Initialization

	make (a_name: STRING;
				an_index: INDEX_LIST;
				an_explanation: STRING;
				a_part: STRING;
				some_classes: CLASS_ENTRIES;
				some_clusters: CLUSTER_ENTRIES)
			-- Initialize `Current'.
		require
			a_name /= Void
			-- an_explanation /= Void --@changed didriksen - explanations are optional
			-- a_part /= Void --@changed didriksen - parts are optional
		do
			make_informal_chart (a_name, an_index, an_explanation, a_part)

			if some_classes /= Void then --@changed didriksen - Added conditional
				create my_classes.make_from_set (some_classes)
			end

			if some_clusters /= Void then --@changed didriksen - Added conditional
				create my_clusters.make_from_set (some_clusters)
			end
		ensure
			name.is_equal (a_name)
			an_index /= Void implies index.is_equal (an_index)
			an_explanation /= Void implies explanation.is_equal (an_explanation)
			a_part /= Void implies part.is_equal (a_part)
			classes_initialized: some_classes /= Void implies classes.is_equal (some_classes)
			clusters_initialized: some_clusters /= Void implies clusters.is_equal (some_clusters)
				--@changed didriksen - Added implications to void feature call on void target.
		end

feature -- Duplication

	copy (other: like Current)
		do
			Precursor (other)
			set_classes (other.classes)
			set_clusters (other.clusters)
		end

feature -- Access

	classes: CLASS_ENTRIES
		do
			Result := my_classes.twin
		ensure
			non_void_result: Result /= Void
		end

	clusters: CLUSTER_ENTRIES
		do
			Result := my_clusters.twin
		ensure
			non_void_result: Result /= Void
		end

feature -- Measurement

	classes_count: INTEGER
		do
			Result := my_classes.count
		ensure
			non_negative_result: Result >= 0
		end

	clusters_count: INTEGER
		do
			Result := my_clusters.count
		ensure
			non_negative_result: Result >= 0
		end

feature -- Status report

	is_part_of (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_classes.is_part_of (other.my_classes) and
				my_clusters.is_part_of (other.my_clusters)
		end

	contains (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_classes.contains (other.my_classes) and
				my_clusters.contains (other.my_clusters)
		end

	is_disjoint (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_classes.is_disjoint (other.my_classes) and
				my_clusters.is_disjoint (other.my_clusters)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := Precursor (other) and
				my_classes.is_equal (other.classes) and
				my_clusters.is_equal (other.clusters)
		end

feature -- Element change

	-- classes

	set_classes (some_classes: CLASS_ENTRIES)
		do
			my_classes := some_classes.twin
		ensure
			classes.is_equal (some_classes)
		end

	add_classes (some_classes: CLASS_ENTRIES)
		do
			my_classes := my_classes.merge (some_classes.twin)
		ensure
			some_classes.is_part_of (classes)
			classes_count = classes.merge (some_classes).count
		end

	add_class (a_class: CLASS_ENTRY)
		require
			a_class /= Void
		do
			my_classes.put (a_class.twin)
		ensure
			classes.has (a_class)
			not (old classes).has (a_class) implies classes_count = old classes_count + 1
			(old classes).has (a_class) implies classes_count = old classes_count
		end

	-- clusters

	set_clusters (some_clusters: CLUSTER_ENTRIES)
		do
			my_clusters := some_clusters.twin
		ensure
			clusters.is_equal (some_clusters)
		end

	add_clusters (some_clusters: CLUSTER_ENTRIES)
		do
			my_clusters := my_clusters.merge (some_clusters.twin)
		ensure
			some_clusters.is_part_of (clusters)
			clusters_count = clusters.merge (some_clusters).count
		end

	add_cluster (a_cluster: CLUSTER_ENTRY)
		require
			a_cluster /= Void
		do
			my_clusters.put (a_cluster.twin)
		ensure
			clusters.has (a_cluster)
			not (old clusters).has (a_cluster) implies clusters_count = old clusters_count + 1
			(old clusters).has (a_cluster) implies clusters_count = old clusters_count
		end

feature -- Removal

	wipe_out
			-- Remove all contents.
		do
			Precursor
			clear_classes
			clear_clusters
		ensure then
			classes.is_empty
			clusters.is_empty
		end

	clear_classes
		do
			my_classes.wipe_out
		ensure
			classes.is_empty
		end

	clear_clusters
		do
			my_clusters.wipe_out
		ensure
			clusters.is_empty
		end

	remove_classes (some_classes: CLASS_ENTRIES)
		do
			my_classes := my_classes.subtract (some_classes)
		ensure
			classes.is_disjoint (some_classes)
			classes_count = old classes_count - classes.intersect (some_classes).count
		end

	remove_class (a_class: CLASS_ENTRY)
		do
			my_classes.remove (a_class)
		ensure
			not classes.has (a_class)
			old classes.has (a_class) implies classes_count = old classes_count - 1
			not old classes.has (a_class) implies classes_count = old classes_count
		end

	remove_clusters (some_clusters: CLUSTER_ENTRIES)
		do
			my_clusters := my_clusters.subtract (some_clusters)
		ensure
			clusters.is_disjoint (some_clusters)
			clusters_count = old clusters_count - clusters.intersect (some_clusters).count
		end

	remove_cluster (a_cluster: CLUSTER_ENTRY)
		do
			my_clusters.remove (a_cluster)
		ensure
			not clusters.has (a_cluster)
			old clusters.has (a_cluster) implies clusters_count = old clusters_count - 1
			not old clusters.has (a_cluster) implies clusters_count = old clusters_count
		end

feature -- Transformation

	canonicalize: like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part,
				Void, Void)
			Result.set_classes (classes.canonicalize)
			Result.set_clusters (clusters.canonicalize)
		end

feature -- Output

	bon_out: STRING
		do
			create Result.make_from_string ("cluster_chart " + my_name + "%N")
			Result.append (Precursor)
			Result.append (my_clusters.bon_out)
			Result.append (my_classes.bon_out)
			Result.append ("end%N")
		end

feature -- Basic operations

	merge (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part,
				Void, Void)
			Result.set_classes (classes.merge (other.classes))
			Result.set_clusters (clusters.merge (other.clusters))
		end

	intersect (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part,
				Void, Void)
			Result.set_classes (classes.intersect (other.classes))
			Result.set_clusters (clusters.intersect (other.clusters))
		end

	subtract (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part,
				Void, Void)
			Result.set_classes (classes.subtract (other.classes))
			Result.set_clusters (clusters.subtract (other.clusters))
		end

	symdif (other: like Current): like Current
		local
			informal_chart: INFORMAL_CHART
		do
			informal_chart := Precursor (other)
			create Result.make (informal_chart.name, informal_chart.index,
				informal_chart.explanation, informal_chart.part,
				Void, Void)
			Result.set_classes (classes.symdif (other.classes))
			Result.set_clusters (clusters.symdif (other.clusters))
		end

feature {CLUSTER_CHART} -- Implementation

	my_classes: CLASS_ENTRIES
	my_clusters: CLUSTER_ENTRIES

invariant

	--classes /= Void
	--clusters /= Void
		--@changed didriksen - Both classes and clusters are optional and can be Void.

end -- class CLUSTER_CHART
