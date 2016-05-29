note
	description: "Summary description for {ANIMAL}."
	author: "Garrett Fleischer"
	date: "5/24/16"
	revision: "1.1.0"

deferred class
	ANIMAL

inherit

	FOOD

feature {ANIMAL} -- Access

	health: INTEGER

	stamina: INTEGER

	hunger: INTEGER

	movement_cost: INTEGER

	socket: NETWORK_STREAM_SOCKET

		--	attributes: LIST[ATTRIBUTES]

feature {NONE} -- Initialization

	animake (sock: NETWORK_STREAM_SOCKET)
		do
			name := "Animal"
			hunger := 0
			health := 100
			stamina := 100
			socket := sock
				--			create attributes.make(0)
		end

feature -- Access

	get_health: INTEGER
		do
			RESULT := health
		end

	set_health (hp: INTEGER)
		do
			health := hp
		end

	get_stamina: INTEGER
		do
			RESULT := stamina
		end

	set_stamina (stam: INTEGER)
		do
			stamina := stam
		end

	get_hunger: INTEGER
		do
			RESULT := hunger
		end

	set_hunger (hun: INTEGER)
		do
			hunger := hun
		end

	get_socket: NETWORK_STREAM_SOCKET
		do
			result := socket
		end

	set_socket (sock: NETWORK_STREAM_SOCKET)
		do
			socket := sock
		end

feature -- Implementation

	move (distance: INTEGER): INTEGER
		local
			intermediate: REAL_64
		do
			if (stamina > (distance * movement_cost)) then
				intermediate := stamina - (distance * movement_cost)
				stamina := intermediate.floor
				RESULT := distance
			else
				intermediate := stamina - (stamina / movement_cost) * movement_cost
				stamina := intermediate.floor
				intermediate := (stamina / movement_cost)
				RESULT := intermediate.floor
			end
		end

	eat (food: FOOD)
		do
		end

invariant
	name_valid: not name.is_empty

end
