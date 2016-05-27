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
feature {NONE}
	make(sock: detachable NETWORK_STREAM_SOCKET)
		do
			animake(sock)
			name:= "Fox"
			movement_cost := 6
		end

feature {ANY}
	eat (food: FOOD)
		do
			if (attached {ANIMAL} food as meat) then
				if (meat.getHealth > 0) then
					meat.setHealth(meat.getHealth - 20)
				else
					hunger := hunger - 50
				end

			end
			if (hunger < 0) then
				stamina := stamina - 10

			end
		end
	end


