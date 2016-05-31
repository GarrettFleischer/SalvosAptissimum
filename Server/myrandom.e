--note
--	description: "Summary description for {MYRANDOM}."
--	author: ""
--	date: "$Date$"
--	revision: "$Revision$"

class
	MYRANDOM

--inherit
--	RANDOM

--create
--	make

--feature {NONE} -- Members

--	real_index: INTEGER

--feature {NONE}

--	make
--		do
--			index := 0
--		end

--feature -- Implementation

--	next_double: DOUBLE
--		do
--			index := index + 1
--			Result := double_i_th (index)
--		end

end
