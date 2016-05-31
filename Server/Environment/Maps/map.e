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

feature {MAP} -- Members

	mutex: MUTEX

feature {NONE} -- Initialization

	make_with_size (w, h: INTEGER)
		do
			create mutex.make
			make_filled (create {FIELD_CELL}.make, w, h)
		end

feature -- Implementation

	fill_random
		local
				rand: RANDOM
				x, y, i: INTEGER
				cell_type: DOUBLE
--				myrand: MYRANDOM
			do
				mutex.lock
					create rand.make
--					create myrand.make
						-- fill random
					i := 1
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
							cell_type := rand.double_i_th (i) * 10
							if (cell_type < 2) then
								put (create {WATER_CELL}.make, x, y)
							elseif (cell_type < 6) then
								put (create {FOREST_CELL}.make, x, y)
							else
								put (create {FIELD_CELL}.make, x, y)
							end
							y := y + 1
							i := i + 1
						end
						x := x + 1
					end
				mutex.unlock
			end

	cell_with (animal: ANIMAL): MAP_CELL
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
					if (item (x, y).animals.has (animal)) then
						Result := item (x, y)
					end
					y := y + 1
				end
				x := x + 1
			end
		end

	cell_x (cell: MAP_CELL): INTEGER
		local
			x, y: INTEGER
		do
			Result := 1
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
					if (item (x, y) = cell) then
						Result := x
					end
					y := y + 1
				end
				x := x + 1
			end
		end

	cell_y (cell: MAP_CELL): INTEGER
		local
			x, y: INTEGER
		do
			Result := 1
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
					if (item (x, y) = cell) then
						Result := y
					end
					y := y + 1
				end
				x := x + 1
			end
		end

end
