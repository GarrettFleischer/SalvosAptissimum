note
	description: "Summary description for {ANIMAL}."
	author: "Garrett Fleischer"
	date: "5/24/16"
	revision: "1.1.0"

deferred class
	ANIMAL

inherit

	ANY

feature -- Access

	name: STRING
	
	health: INTEGER

	stamina: INTEGER

	hunger: INTEGER

	attributes: LIST[ATTRIBUTES]



feature -- Actions

	eat (food: FOOD)
		do
		end

invariant
	name_valid: not name.is_empty

end
