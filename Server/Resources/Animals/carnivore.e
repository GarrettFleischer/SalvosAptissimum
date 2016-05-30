note
	description: "Meat eating Animal Subclass."
	author: "Jose Moreno"
	date: "5/24/16"
	revision: "1.00"

class
	CARNIVORE

inherit

	ANIMAL
		redefine
			eat
		end

create
	make

feature {NONE} -- Initialization

	make (sock: NETWORK_STREAM_SOCKET; a_arrived: like arrived)
		do
			animake (sock, a_arrived)
			name := "Fox"
			plural_name := "Foxes"
			run_speed := 4
			walk_speed := 2
			move_cost := 6
		end

feature {ANIMAL} -- Implementation

	eat (food: FOOD)
		do
			if (attached {ANIMAL} food as meat) then
				if (meat.get_health > 0) then
					meat.set_health (meat.get_health - 20)
				else
					hunger := hunger - 50
				end
			end
			if (hunger < 0) then
				stamina := stamina - 10
			end
		end

end
