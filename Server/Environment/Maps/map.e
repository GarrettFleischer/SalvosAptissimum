note
	description: "Summary description for {MAP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAP

inherit

	ARRAY2 [MAP_CELL]

create
	make_with_size

feature {NONE} -- Initialization

	make_with_size (w, h: INTEGER)
		local
			default_cell: MAP_CELL
			rand: RANDOM
			x, y, i, cell_type: INTEGER
		do
			create rand.make

			default_cell := create {GRASS_CELL}.make
			make_filled (default_cell, w, h)


			from
				i := 1
			until
				i = w
			loop
				x := rand.next_random (w)
				y := rand.next_random (h)
				cell_type := rand.next_random (5)
				if (cell_type = 0 or cell_type = 1) then
					put(create {TREE_CELL}.make, x, y)
				elseif (cell_type = 2) then
					put(create {WATER_CELL}.make, x, y)
				end
				i := i + 1
			end

		end

feature -- Implementation

	cell_with(animal: ANIMAL): MAP_CELL
		local
			x, y: INTEGER
		do
			Result := item (1, 1)
			from
				x := 1
			until
				x = width
			loop
				from
					y := 1
				until
					y = height
				loop
					if (item(x, y).animals.has (animal)) then
						Result := item(x, y)
					end
					y := y + 1
				end
				x := x + 1
			end
		end

end
