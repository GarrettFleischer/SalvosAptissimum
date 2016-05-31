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
			name := "Carrot"
			plural_name := "Carrots"
		end

end
