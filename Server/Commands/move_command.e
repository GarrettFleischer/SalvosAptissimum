note
	description: "Summary description for {MOVE_COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_COMMAND

inherit
	COMMAND

create
	make

feature {NONE} -- Constants

	north: INTEGER = 1

	south: INTEGER = 2

	east: INTEGER = 3

	west: INTEGER = 4

feature {COMMAND} -- Members

	animal: ANIMAL

	map: MAP

	direction: CHARACTER

	running: BOOLEAN

	send_message: PROCEDURE[SOCKET, STRING, STRING]

	distance: REAL

	executed: BOOLEAN

feature {NONE} -- Initialization

	make (a_animal: ANIMAL; a_map: MAP; a_direction: CHARACTER; a_running: BOOLEAN; a_send: like send_message)
		do
				-- inherited
			finished := false

				-- local
			animal := a_animal
			map := a_map
			direction := a_direction
			running := a_running
			send_message := a_send
			distance := map.cell_with (animal).size
			executed := false
		end

feature {COMMAND} -- Inherited

	execute
		local
			x, y, dir, i: INTEGER
			cell: MAP_CELL
			dir_str, op_dir_str: STRING
			look_command: LOOK_COMMAND
		do
			if (animal.needs_destroyed) then
				finished := true
			else
				cell := map.cell_with (animal)
				x := map.cell_x (cell)
				y := map.cell_y (cell)
				if (direction.is_equal ('n')) then
					y := y - 1
					dir := north
					dir_str := "North"
					op_dir_str := "South"
				elseif (direction.is_equal ('s')) then
					y := y + 1
					dir := south
					dir_str := "South"
					op_dir_str := "North"
				elseif (direction.is_equal ('e')) then
					x := x + 1
					dir := east
					dir_str := "East"
					op_dir_str := "West"
				else
					x := x - 1
					dir := west
					dir_str := "West"
					op_dir_str := "East"
				end

				if ((1 <= x and x <= map.width) and (1 <= y and y <= map.height)) then
						-- send reply on first execution
					if (not executed) then
						executed := true
						if (running) then
							send_message.call (animal.get_socket, {SERVER_COMMANDS}.log, "running " + dir_str + "...")
						else
							send_message.call (animal.get_socket, {SERVER_COMMANDS}.log, "walking " + dir_str + "...")
						end
					end
						-- update distance traveled
					if (running) then
						distance := animal.run (distance)
					else
						distance := animal.walk (distance)
					end
				else
					send_message.call (animal.get_socket, {SERVER_COMMANDS}.log, "there appears to be an invisible wall here...")
					finished := true
				end

				if (distance <= 0) then
						-- leave current room
					from
						i := 1
					until
						i = cell.animals.count + 1
					loop
						if (cell.animals[i] /= animal) then
							send_message.call (cell.animals[i].get_socket, {SERVER_COMMANDS}.log, "a " + animal.get_name + " leaves to the " + dir_str)
						end
						i := i + 1
					end
					cell.remove_animal (animal)

						-- enter new room
					cell := map[x, y]
					from
						i := 1
					until
						i = cell.animals.count + 1
					loop
						send_message.call (cell.animals[i].get_socket, {SERVER_COMMANDS}.log, "a " + animal.get_name + " arrives from the " + op_dir_str)
						i := i + 1
					end
					cell.add_animal (animal)

					create look_command.make (animal, map, send_message)
					look_command.execute

					finished := true
				end
			end
		end

end
