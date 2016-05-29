note
	description: "Summary description for {GRASS_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRASS_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		do
			make_with_description_and_passable ("a grassy field with the occasional flower and bumbling bee", "a grassy field", true)
		end

end
