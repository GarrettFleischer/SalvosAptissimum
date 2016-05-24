note
	description: "Summary description for {CARROT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CARROT

inherit

	VEGETABLE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create name.make_from_string ("Carrot")
		end

end
