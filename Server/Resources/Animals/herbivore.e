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

	make(sock: detachable NETWORK_STREAM_SOCKET)
			-- Initialization for `Current'.
		do
			animake(sock)
			name:= "Rabbit"
			movement_cost :=5
		end

feature{ANY} -- Basic operations

	eat (food: FOOD)
		do
				-- Ensure that the food is a vegetable, else get sick
			if (attached {VEGETABLE} food) then
				hunger := hunger - 35
			else
				if(attached {ANIMAL} food as enemy) then
					enemy.setHealth(enemy.getHealth - 10)
				end
			end
			if (hunger < 0) then
				hunger := 0
			end
		end
end
