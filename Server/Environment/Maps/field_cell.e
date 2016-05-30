note
	description: "Summary description for {FIELD_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		do
			make_with_description ("a grassy field with the occasional flower and bumbling bee", "a grassy field")
			size := 15
		end

end
