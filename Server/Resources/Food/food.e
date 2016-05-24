note
	description: "Summary description for {FOOD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FOOD

inherit

	ANY

feature -- Access

	name: STRING

invariant
	name_valid: not name.is_empty

end
