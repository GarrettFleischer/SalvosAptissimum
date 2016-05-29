note
	description: "Summary description for {ANIMAL_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANIMAL_FACTORY

inherit

	ANY

feature {NONE} -- Factory get method

	make_animal (name: STRING; socket: NETWORK_STREAM_SOCKET): ANIMAL
		require
			name_not_empty: not name.is_empty
		local
			animal: ANIMAL
		do
			if (name.is_case_insensitive_equal ("fox")) then
				animal := create {CARNIVORE}.make (socket)
			elseif (name.is_case_insensitive_equal ("rabbit")) then
				animal := create {HERBIVORE}.make (socket)
			else --if (name.is_case_insensitive_equal ("badger")) then
				animal := create {OMNIVORE}.make (socket)
			end

			Result := animal
		end

end
