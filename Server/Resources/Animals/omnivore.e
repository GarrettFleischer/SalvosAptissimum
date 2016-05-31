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

	make (sock: NETWORK_STREAM_SOCKET)
		do
			animake (sock)
			name := "Badger"
			plural_name := "Badgers"
			sound := "growls"
			run_speed := 3
			walk_speed := 2
			move_cost := 12
		end

feature {ANY}

	eat (food: FOOD)
		do
			if (attached {ANIMAL} food as meat) then
				if (meat.get_health > 0) then
					meat.set_health (meat.get_health - 15)
				else
					hunger := hunger - 35
				end
			else
				hunger := hunger - 20
			end
		end

end
