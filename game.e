note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Unnamed", "protocol=URI", "src=http://www.yourwebsite.com"

class
	GAME
inherit
	APPLICATION

feature -- Access

	BACKGROUND: IMAGE
			-- `BACKGROUND'
		attribute Result := ({like BACKGROUND}).default end --| Remove line when Void Safety is properly set

end
