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
	make
		do
			animake
		end

feature {NONE}

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
