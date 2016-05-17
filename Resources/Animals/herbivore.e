note
	description: "Summary description for {HERBIVORE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HERBIVORE

inherit
	ANIMAL
		redefine
			eat
	end

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			name := ""
			hunger := 100
		end

feature -- Basic operations

	eat (food: FOOD)
	do
			-- Ensure that the food is a vegetable, else get sick
		if (attached {VEGETABLE} food) then
			hunger := hunger + 10
		else
			hunger := hunger - 50
		end

		if (hunger < 0) then
			hunger := 0
		elseif (hunger > 100) then
			hunger := 100
		end
	end

end