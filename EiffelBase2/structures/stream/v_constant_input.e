note
	description: "Input stream that always provides the same value."
	author: "Nadia Polikarpova"
	date: "$Date$"
	revision: "$Revision$"
	model: item

class
	V_CONSTANT_INPUT [G]

inherit
	V_INPUT_STREAM [G]

feature {NONE} -- Initialization
	make (v: G)
			-- Create a stream that provides `v'.
		do
			item := v
		ensure
			item_effect: item = v
		end

feature -- Access
	item: G
			-- Item at current position.

feature -- Status report
	off: BOOLEAN = False
			-- Is current position off scope?

feature -- Cursor movement
	forth
			-- Move one position forward.
		do
		ensure then
			item_effect: item = old item
		end
end
