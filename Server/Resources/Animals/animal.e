note
	description: "Summary description for {ANIMAL}."
	author: "Garrett Fleischer"
	date: "5/15/16"
	revision: "1.0.0"

deferred class
	ANIMAL

inherit

	ANY

feature -- Access

	name: STRING

	hunger: INTEGER

feature -- Actions

	eat (food: FOOD)
		do
		end

invariant
	name_valid: not name.is_empty

end
