note
	description: "Summary description for {FOREST_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FOREST_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		do
			make_with_description ("a stand of trees with a tall oak, gnarled and weary with age", "a stand of trees")
			size := 25
		end

end
