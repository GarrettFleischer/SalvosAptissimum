note
	description: "Summary description for {FOOD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FOOD

inherit

	ANY

feature -- Members

	name: STRING

feature {ANY} -- Access

	get_name: STRING
		do
			Result := name
		end

invariant
	name_valid: not name.is_empty

end
