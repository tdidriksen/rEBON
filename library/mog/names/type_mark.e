note
	description: "A type mark."

class TYPE_MARK

inherit
	ANY
	BON_TEXT

creation
	make, make_singleton, make_aggregate, make_shared

feature -- Initialization

	make, make_singleton
			-- Initialize `Current' to be a singleton type mark.
		do
			singleton := true
			aggregate := false
			shared := false
			multiplicity := 1
		end

	make_aggregate
			-- Initialize `Current' to be an aggregate type mark.
		do
			singleton := false
			aggregate := true
			shared := false
		end

	make_shared (a_multiplicity: INTEGER)
			-- Initialize `Current' to be an shared type mark with the specified multiplicity.
		do
			singleton := false
			aggregate := false
			shared := true
			multiplicity := a_multiplicity
		end

feature -- Output

	bon_out: STRING
		do
			if singleton then
				Result := ":"
			elseif aggregate then
				Result := ":{"
			elseif shared then
				Result := ": ("
				Result.append (multiplicity.out)
				Result.append (")")
			end
		end

feature -- Access

	singleton: BOOLEAN
			-- A normal type mark of ':'.

	aggregate: BOOLEAN
			-- An aggregate type mark ':{'.

	shared: BOOLEAN
			-- A shared type mark ': (<nat>)' with a multiplicity.

	multiplicity: INTEGER
			-- The multiplicity of a shared type mark.

invariant

	singleton xor aggregate xor shared
	multiplicity >= 0
	singleton implies multiplicity = 1

end -- class TYPE_MARK
