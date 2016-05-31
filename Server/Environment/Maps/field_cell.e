note
	description: "Summary description for {FIELD_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL

inherit

	MAP_CELL

create
	make

feature {NONE} -- Initialization

	make
		do
			make_with_description ("a grassy field with the occasional flower and bumbling bee", "a grassy field")
--			desc_choice := (rand.next_double * 3).floor
--			if (desc_choice = 0) then
--				make_with_description ("a dry, dusty plain devoid of life", "a dusty plain")
--			elseif (desc_choice = 1) then
--				make_with_description ("a swath of tall grass filled with singing insects", "a swath of tall grass")
--			else
--				make_with_description ("a grassy field with the occasional flower and bumbling bee", "a grassy field")
--			end
			size := 15
		end

end
