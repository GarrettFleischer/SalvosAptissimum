note
	description: "Summary description for {SERVER_COMMANDS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SERVER_COMMANDS

feature -- Constants

	quit: STRING = "SVR_QUIT "
		-- tell client to disconnect

	log: STRING = "SVR_LOG "
		-- tell client to log the following message

	map: STRING = "SVR_MAP "
		-- to send map updates to client

	stat: STRING = "SVR_STAT "
		-- to send animal stat updates to client

end
