note
	description: "Summary description for {DIET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DIET

inherit
	ANY

feature -- Access

	hunger: INTEGER

feature -- Basic operations

	eat (food: FOOD)
		require
			food_exists: food /= void
		deferred
		ensure
			hunger_changed: hunger /= old hunger
		end

invariant
	hunger_valid: hunger >= 0 and hunger <= 100

end
