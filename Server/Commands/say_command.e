note
	description: "Summary description for {SAY_COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SAY_COMMAND

inherit
	COMMAND

create
	make

feature {COMMAND} -- Members

	animal: ANIMAL

	message: STRING

	map: MAP

	send_message: PROCEDURE[SOCKET, STRING, STRING]

feature {NONE} -- Initialization

	make (a_animal: ANIMAL; a_map: MAP; a_message: STRING; a_send: like send_message)
		do
				-- inherited
			finished := false

				-- local
			animal := a_animal
			message := a_message
			map := a_map
			send_message := a_send

		end

feature {COMMAND} -- Inherited

	execute
		local
			i: INTEGER
			cell: MAP_CELL
		do
				-- only speak to clients in the same cell
			if (animal.needs_destroyed) then
				finished := true
			else
				cell := map.cell_with (animal)
				from
					i := 1
				until
					i = cell.animals.count + 1
				loop
					if (cell.animals [i].get_socket /= animal.get_socket) then
						if (cell.animals [i].get_name.is_equal (animal.get_name)) then
							send_message.call (cell.animals [i].get_socket, {SERVER_COMMAND}.log, "a " + animal.get_name + " says, " + message)
						else
							send_message.call (cell.animals [i].get_socket, {SERVER_COMMAND}.log, "a " + animal.get_name + " " + animal.get_sound)
						end
					else
						send_message.call (cell.animals [i].get_socket, {SERVER_COMMAND}.log, "you say, " + message)
					end
					i := i + 1
				end

				finished := true
			end
		end

end
