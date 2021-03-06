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

	make (sock: like socket)
			-- Initialization for `Current'.
		do
			animake (sock)
			name := "Rabbit"
			plural_name := "Rabbits"
			sound := "chirps"
			run_speed := 5
			walk_speed := 2
			move_cost := 8
		end

feature {ANY} -- Basic operations

	eat (food: FOOD)
		do
				-- Ensure that the food is a vegetable, else get sick
			if (attached {VEGETABLE} food) then
				hunger := hunger - 35
			else
				if (attached {ANIMAL} food as enemy) then
					enemy.set_health (enemy.get_health - 10)
				end
			end
			if (hunger < 0) then
				hunger := 0
			end
		end

end
