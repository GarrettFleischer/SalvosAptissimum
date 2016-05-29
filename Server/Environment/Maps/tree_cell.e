note
	description: "Summary description for {TREE_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TREE_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		local
			rand: RANDOM
		do
			create rand.make
			make_with_description_and_passable ("a tall oak, gnarled and weary with age", "an old oak tree", true)
		end

end
