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
			eat,
			move
		end

create
	make
feature {NONE}
	make
		do
			animake
		end

feature {ANY}
	eat (food: FOOD)
		do
			if (attached {ANIMAL} food) then
				if (food.getHealth > 0) then
					food.setHealth(food.getHealth - 20)
				else
					hunger := hunger - 50
				end

			end
			if (hunger < 0) then
				stamina := stamina - 10

			end
		end
	end

	move ( distance : INTEGER): INTEGER
		local
			intermediate: REAL_64
		do
			if(stamina > (distance *6))then
				intermediate := stamina - (distance *6)
				stamina := intermediate.floor
				RESULT := distance
			else
				intermediate := stamina - (stamina/6)*6
				stamina := intermediate.floor
				intermediate := (stamina/6)
				RESULT := intermediate.floor
			end
		end
