note
	description: "Summary description for {LOOK_COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOOK_COMMAND

inherit
	COMMAND

create
	make

feature {COMMAND} -- Members

	animal: ANIMAL

	map: MAP

	send_message: PROCEDURE[SOCKET, STRING, STRING]

feature {NONE} -- Initialization

	make (a_animal: ANIMAL; a_map: MAP; a_send: like send_message)
		do
				-- inherited
			finished := false

				-- local
			animal := a_animal
			map := a_map
			send_message := a_send
		end

feature {COMMAND} -- Inherited

	execute
		local
			cell: MAP_CELL
			x, y: INTEGER
			surroundings: STRING
		do
			if (animal.needs_destroyed) then
				finished := true
			else
				cell := map.cell_with (animal)
				x := map.cell_x(cell)
				y := map.cell_y(cell)
				surroundings := "you see " + cell.description
				surroundings := surroundings + "%N" + {SERVER_COMMANDS}.log
				surroundings := surroundings + "there is " + cell.animal_list + " here"
				if (y > 1) then
					surroundings := surroundings + "%N" + {SERVER_COMMANDS}.log
					surroundings := surroundings + "to the North is " + map [x, y - 1].get_short
				end
				if (y < map.height) then
					surroundings := surroundings + "%N" + {SERVER_COMMANDS}.log
					surroundings := surroundings + "to the South is " + map [x, y + 1].get_short
				end
				if (x < map.width) then
					surroundings := surroundings + "%N" + {SERVER_COMMANDS}.log
					surroundings := surroundings + "to the East is " + map [x + 1, y].get_short
				end
				if (x > 1) then
					surroundings := surroundings + "%N" + {SERVER_COMMANDS}.log
					surroundings := surroundings + "to the West is " + map [x - 1, y].get_short
				end

				send_message.call (animal.get_socket, {SERVER_COMMANDS}.log, surroundings)

				finished := true
			end
		end

end
