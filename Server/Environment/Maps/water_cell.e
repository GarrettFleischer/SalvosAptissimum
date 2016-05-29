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
			make_with_description_and_passable ("a pool of water with pond lillies floating in the center", "a pool of water", false)
		end

end
