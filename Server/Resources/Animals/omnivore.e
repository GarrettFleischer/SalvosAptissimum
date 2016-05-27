note
	description: "Summary description for {OMNIVORE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OMNIVORE

inherit
	ANIMAL
		redefine
			eat,
			move
		end

create
	make

feature {NONE} -- Initialization
	make
		do
			animake
		end
feature {ANY}
	eat (food: FOOD)
		do
			if (attached {ANIMAL} food as meat) then
				if (meat.getHealth > 0) then
					meat.sethealth(meat.getHealth -15)
				else
					hunger := hunger - 35
				end
			else
				hunger := hunger - 20
			end
		end

	move ( distance : INTEGER): INTEGER
		local
			intermediate: REAL_64
		do
			if(stamina > (distance *7))then
				intermediate := (stamina - (distance *7))
				stamina := intermediate.floor
				Result := distance
			else
				intermediate := (stamina - (stamina/7)*7)
				stamina := intermediate.floor
				intermediate := stamina/7
				Result := intermediate.floor
			end
		end
end
