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

		-- base stats

	health: REAL

	stamina: REAL

	hunger: REAL

	socket: NETWORK_STREAM_SOCKET

		-- movement

	move_cost: REAL

	run_speed: REAL

	walk_speed: REAL

	travel_dist: REAL

	traveling: BOOLEAN

	running: BOOLEAN

	direction: INTEGER

		-- vision

	vision_dist: REAL

	vision_angle: REAL

		-- agents

	arrived: PROCEDURE [ANIMAL]

		-- Update loop
	destroy: BOOLEAN

		--	attributes: LIST[ATTRIBUTES]

feature {ANIMAL} -- Initialization

	animake (sock: like socket; a_arrived: like arrived)
		do
			name := "Animal"
			hunger := 0
			health := 100
			stamina := 100
			socket := sock
			arrived := a_arrived
			destroy := false
				--			create attributes.make(0)
		end

feature -- Access

	get_health: REAL
		do
			RESULT := health
		end

	set_health (hp: REAL)
		do
			health := hp
		end

	get_stamina: REAL
		do
			RESULT := stamina
		end

	set_stamina (stam: REAL)
		do
			stamina := stam
		end

	get_hunger: REAL
		do
			RESULT := hunger
		end

	set_hunger (hun: REAL)
		do
			hunger := hun
		end

	get_direction: INTEGER
		do
			Result := direction
		end

	get_socket: NETWORK_STREAM_SOCKET
		do
			result := socket
		end

	set_socket (sock: NETWORK_STREAM_SOCKET)
		do
			socket := sock
		end

	needs_destroyed: BOOLEAN
		do
			Result := destroy
		end


feature -- Implementation

	update
		local
			stamina_regen: REAL
		do
				-- Init locals
			if (stamina < 100) then
				stamina_regen := 0.01 -- 100 updates
			else
				stamina_regen := 0
			end

				-- perform movement
			if (travel_dist > 0) then
				if (running) then
					if (stamina >= move_cost) then
						stamina := stamina - move_cost
						travel_dist := travel_dist - run_speed
					else
						travel_dist := travel_dist - walk_speed
					end
				else
					travel_dist := travel_dist - walk_speed
				end
			else
				stamina_regen := stamina_regen * 2
			end

				-- check if movement finished
			if (travel_dist <= 0 and traveling) then
				traveling := false
				arrived.call (current) -- call arrived agent
			end

				-- perform recovery
			health := health + 0.001 -- 1000 updates
			stamina := stamina + stamina_regen
		end

	walk (dist: REAL; dir: INTEGER)
		require
			valid_dist: dist >= 0
		do
			traveling := true
			travel_dist := dist
			direction := dir
			running := false
		end

	run (dist: REAL; dir: INTEGER)
		require
			valid_dist: dist >= 0
		do
		traveling := true
			travel_dist := dist
			direction := dir
			running := true
		end

	eat (food: FOOD)
		do
		end

	destroy_later
		do
			destroy := true
		end


invariant
	name_valid: not name.is_empty

end
