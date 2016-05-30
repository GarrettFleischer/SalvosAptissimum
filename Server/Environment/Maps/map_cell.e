note
	description: "Summary description for {MAP_CELL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MAP_CELL

inherit

	ANY

feature {ANY} -- Members

	description: STRING

	short_desc: STRING

	passable: BOOLEAN

	size: REAL

	animals: ARRAYED_LIST [ANIMAL]

	-- TODO add vision impairement based on terrain type

feature {NONE} -- Initialization

	make_with_description (desc, short: STRING)
		require
			desc_not_empty: not desc.is_empty
			short_not_empty: not short.is_empty
		do
			description := desc
			short_desc := short
			passable := true -- default to true until implemented

			create animals.make (0)
		ensure
			description_updated: description = desc
			short_description_updated: short_desc = short
		end

feature {ANY} -- Implementation

	add_animal (animal: ANIMAL)
		require
			new_animal: not animals.has (animal)
		do
			animals.extend (animal)
		ensure
			animals_updated: animals.has (animal)
		end

	remove_animal (animal: ANIMAL)
		require
			animal_contained: animals.has (animal)
		do
			animals.prune_all (animal)
		ensure
			animals_updated: not animals.has (animal)
		end

feature {ANY} -- Getters

	get_animals: ARRAYED_LIST [ANIMAL]
		do
			Result := animals
		end

	get_long: STRING
		local
			str: STRING
		do
			str := animal_list
			if str.count > 0 then
				Result := description + ". There is " + animal_list + " here."
			else
				Result := description
			end
		end

	get_short: STRING
		local
			str: STRING
		do
			str := animal_list
			if str.count > 0 then
				Result := short_desc + ". In it is " + animal_list
			else
				Result := short_desc
			end
		end

	animal_list: STRING
		local
			i: INTEGER
			str: STRING
			nums: STRING_TABLE[INTEGER]
		do
			create nums.make (0)
			str := ""

			from
				i := 1
			until
				i = animals.count + 1
			loop
				if (not nums.has_key (animals[i].get_plural)) then
					nums.extend (1, animals[i].get_plural)
				else
					nums.force (nums.at (animals[i].get_plural) + 1, animals[i].get_plural)
				end
				i := i + 1
			end

			from
				i := 1
			until
				i = nums.count + 1
			loop
				if(i = 1) then
					str := nums.at (nums.current_keys[i]).out + " " + nums.current_keys[i]
				elseif(i = nums.count) then
					str := str + ", and " + nums.at (nums.current_keys[i]).out + " " + nums.current_keys[i]
				else
					str := str + ", " + nums.at (nums.current_keys[i]).out + " " + nums.current_keys[i]
				end
				i := i + 1
			end

			Result := str
		end

	is_passable: BOOLEAN
		do
			Result := passable
		end

end
