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

	make (update: detachable like update_proc)
		do
			make_with_description ("a stand of trees with a tall oak, gnarled and weary with age, in the center", "an old oak tree", update)
			size := 10
		end

end
