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

	plural_name: STRING

feature {ANY} -- Access

	get_name: STRING
		do
			Result := name
		end

	get_plural: STRING
		do
			Result := plural_name
		end

invariant
	name_valid: not name.is_empty

end
