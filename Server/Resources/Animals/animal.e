note
	description: "Summary description for {ANIMAL}."
	author: "Garrett Fleischer"
	date: "5/24/16"
	revision: "1.1.0"

deferred class
	ANIMAL

inherit

	FOOD
--		redefine
--			make
--		end



feature{ANIMAL} -- Access

--	name: STRING

	health: INTEGER

	stamina: INTEGER

	hunger: INTEGER

	movement_cost: INTEGER

	socket: detachable NETWORK_STREAM_SOCKET

--	attributes: LIST[ATTRIBUTES]



feature {NONE} -- Initialization
	animake(sock: detachable NETWORK_STREAM_SOCKET)

		do
			name:= "Animal"
			hunger := 0
			health := 100
			stamina := 100
			socket := sock
--			create attributes.make(0)
		end

feature -- Actions
	move ( distance : INTEGER): INTEGER
		local
			intermediate: REAL_64
		do
			if(stamina > (distance *movement_cost))then
				intermediate := stamina - (distance *movement_cost)
				stamina := intermediate.floor
				RESULT := distance
			else
				intermediate := stamina - (stamina/movement_cost)*movement_cost
				stamina := intermediate.floor
				intermediate := (stamina/movement_cost)
				RESULT := intermediate.floor
			end
		end
	getHealth : INTEGER
		do
			RESULT := health
		end

	setHealth(hp: INTEGER)
		do
			health := hp
		end
	getStamina : INTEGER
		do
			RESULT := stamina
		end
	setStamina(stam: INTEGER)
		do
			stamina := stam
		end
	getHunger : INTEGER
		do
			RESULT := hunger
		end
	setHunger(hun: INTEGER)
		do
			hunger := hun
		end
	eat (food: FOOD)
		do

		end
	getSocket: detachable NETWORK_STREAM_SOCKET
		do
			result := socket
		end
	setSocket(sock: detachable NETWORK_STREAM_SOCKET)
		do
			socket := sock
		end
invariant
	name_valid: not name.is_empty

end
