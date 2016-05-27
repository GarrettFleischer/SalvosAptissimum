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
			eat
		end

create
	make

feature {NONE} -- Initialization
	make(sock: detachable NETWORK_STREAM_SOCKET)
		do
			animake(sock)
			name:= "Badger"
			movement_cost:= 7
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
end
