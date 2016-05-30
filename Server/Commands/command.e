note
	description: "Summary description for {COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMMAND

inherit
	ANY

feature {COMMAND} -- Members

	finished: BOOLEAN

feature {ANY} -- Prototypes

	execute
		deferred
		end

	is_finished: BOOLEAN
		do
			Result := finished
		end


end
