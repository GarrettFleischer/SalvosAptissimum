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

	animals: ARRAYED_LIST [ANIMAL]

feature {NONE} -- Initialization

	make_with_description_and_passable (desc, short: STRING; pass: BOOLEAN)
		require
			desc_not_empty: not desc.is_empty
			short_not_empty: not short.is_empty
		do
			description := desc
			short_desc := short
			passable := pass
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
			animals.prune (animal)
		ensure
			animals_updated: not animals.has (animal)
		end

feature {ANY} -- Getters

	get_animals: ARRAYED_LIST [ANIMAL]
		do
			Result := animals
		end

	get_long: STRING
		do
			Result := description
		end

	get_short: STRING
		do
			Result := short_desc
		end

	is_passable: BOOLEAN
		do
			Result := passable
		end

end
