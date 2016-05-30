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

	make (update: detachable like update_proc)
		do
			make_with_description ("a grassy field with the occasional flower and bumbling bee", "a grassy field", update)
			size := 8
		end

end
