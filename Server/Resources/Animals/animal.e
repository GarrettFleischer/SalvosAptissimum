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

	walking: BOOLEAN

	running: BOOLEAN

		-- vision

	vision_dist: REAL

	vision_angle: REAL

		-- speech

	sound: STRING

		-- Update loop
	destroy: BOOLEAN

		--	attributes: LIST[ATTRIBUTES]

feature {ANIMAL} -- Initialization

	animake (sock: like socket)
		do
			name := "Animal"
			hunger := 0
			health := 100
			stamina := 100
			socket := sock
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

	get_sound: STRING
		do
			Result := sound
		end

	get_hunger: REAL
		do
			RESULT := hunger
		end

	set_hunger (hun: REAL)
		do
			hunger := hun
		end

	get_socket: NETWORK_STREAM_SOCKET
		do
			result := socket
		end

	is_moving: BOOLEAN
		do
			Result := running or walking
		end

	needs_destroyed: BOOLEAN
		do
			Result := destroy
		end


feature -- Implementation

	update
		local
			stamina_regen: REAL
			health_regen: REAL
		do
				-- Init locals
				stamina_regen := 0
				health_regen := 0

			if (stamina < 100) then
				stamina_regen := 0.01 -- 100 updates
			end
			if (health < 100) then
				health_regen := 0.01 -- 100 updates
			end

				-- Perform recovery
			hunger := hunger + 0.001 -- starvation can happen...
			health := health + health_regen
			if (not running and not walking) then
				stamina := stamina + stamina_regen
			end
		end

	walk (dist: REAL) : REAL
		require
			valid_dist: dist >= 0
		local
			travel_dist: like dist
		do
			running := false
			walking := true
			travel_dist := dist - walk_speed
			if(travel_dist <= 0) then
				walking := false
			end

			Result := travel_dist
		end

	run (dist: REAL): REAL
		require
			valid_dist: dist >= 0
		local
			travel_dist: like dist
		do
			if (stamina >= move_cost) then
				stamina := stamina - move_cost
				walking := false
				running := true
				travel_dist := dist - run_speed
			else
				travel_dist := walk(dist)
			end

			if(travel_dist <= 0) then
				running := false
			end

			Result := travel_dist
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
	walk_or_run: not (walking and running)
end
