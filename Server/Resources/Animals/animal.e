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

--	attributes: LIST[ATTRIBUTES]



feature {NONE} -- Initialization
	animake

		do
			name:= "Animal"
			hunger := 0
			health := 100
			stamina := 100
--			create attributes.make(0)
		end

feature -- Actions
	getHealth(): INTEGER
		do
			RESULT := health
		end

	setHealth(hp: INTEGER)
		do
			health := hp
		end
	getStamina(): INTEGER
		do
			RESULT := stamina
		end
	setStamina(stam: INTEGER)
		do
			stamina := stam
		end
	getHunger(): INTEGER
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
	move(distance: INTEGER): INTEGER
		do
			RESULT := distance
		end

invariant
	name_valid: not name.is_empty

end
