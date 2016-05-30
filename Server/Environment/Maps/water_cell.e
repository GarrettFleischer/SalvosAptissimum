note
	description: "Summary description for {WATER_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WATER_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		do
			make_with_description ("a pool of water with pond lillies floating in the center", "a pool of water")
			size := 35
		end

end
