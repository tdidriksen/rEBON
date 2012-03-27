note
	description: "A BON specification."

class
	BON_SPECIFICATION

inherit
	BON_TEXT
		redefine
			bon_out
		end

	CANONICALIZABLE
		redefine
			copy, is_equal, canonicalize
		end

creation
	make, make_from_elements, make_from_element

feature -- Initialization

	make
			-- Initialize `Current'.
		do
			create my_elements.make
		end

	make_from_elements (some_elements: SPECIFICATION_ELEMENTS)
			-- Initialize `Current'.
		do
			create my_elements.make_from_set (some_elements)
		ensure
			elements.is_equal (some_elements)
		end

	make_from_element (an_element: SPECIFICATION_ELEMENT)
			-- Initialize `Current'.
		do
			create my_elements.make
			add_element (an_element)
		ensure
			elements.has (an_element) and elements.count = 1
		end

feature -- Access

	elements: SPECIFICATION_ELEMENTS
			-- The elements in this specification.
		do
			Result := my_elements.twin
		ensure
			non_void_result: Result /= Void
		end

feature -- Measurement

	elements_count: INTEGER
			-- The number of elements in this specification.
		do
			Result := my_elements.count
		ensure
			non_negative_result: Result >= 0
		end

feature -- Status report

	is_valid: BOOLEAN
			-- A flag indicating if the current element is valid.
		do
			Result := my_elements.is_valid
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
		do
			Result := elements.is_equal (other.elements)
		end

feature -- Duplication

	copy (other: like Current)
		do
			set_elements (other.elements)
		end

feature -- Element change

	set_elements (some_elements: SPECIFICATION_ELEMENTS)
			-- Set the elements of `Current'.
		do
			my_elements.wipe_out
			my_elements.append (some_elements.twin)
		ensure
			elements.is_equal (some_elements)
		end

	add_elements (some_elements: SPECIFICATION_ELEMENTS)
			-- Add some elements to `Current'.
		do
			my_elements.append (some_elements.twin)
		ensure
			some_elements.is_subset (elements)
			elements_count = elements.merge (some_elements).count
		end

	add_element (an_element: SPECIFICATION_ELEMENT)
			-- Add an element to `Current'.
		do
			my_elements.put (an_element.twin)
		ensure
			elements.has (an_element)
			not (old elements).has (an_element) implies elements_count = old elements_count + 1
			(old elements).has (an_element) implies elements_count = old elements_count
		end

feature -- Removal

	wipe_out
			-- Remove all contents.
		do
			clear_elements
		ensure
			elements.is_empty
		end

	clear_elements
			-- Remove all elements.
		do
			my_elements.wipe_out
		ensure
			elements.is_empty
		end

feature -- Transformation

	canonicalize: like Current
		do
			create Result.make
			set_elements (elements.canonicalize)
		end

feature -- Output

	bon_out: STRING
		do
			Result := my_elements.bon_out
		end

feature {BON_SPECIFICATION} -- Implementation

	my_elements: SPECIFICATION_ELEMENTS

invariant

	my_elements /= Void

end -- class BON_SPECIFICATION
