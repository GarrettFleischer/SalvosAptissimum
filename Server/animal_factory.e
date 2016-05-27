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

	make_animal (name: STRING; socket: detachable NETWORK_STREAM_SOCKET) : ANIMAL
	require
		name_not_empty: not name.is_empty
	local
		fox: CARNIVORE
		rabbit: HERBIVORE
		badger: OMNIVORE
	do
--		if (name.is_case_insensitive_equal ("fox")) then
--			create fox.make (socket)
--			Result := fox
--		elseif (name.is_case_insensitive_equal ("rabbit")) then
--			create rabbit.make (socket)
--			Result := rabbit
--		else --if (name.is_case_insensitive_equal ("badger")) then
--			create badger.make (socket)
--			Result := badger
--		end
	end

end
