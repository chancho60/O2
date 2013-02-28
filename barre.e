note
	description: "Summary description for {BARRE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BARRE

inherit
	MUR

	IMAGE

feature -- Access

	BARRE_BOUGER: DEPLACEMENT
			-- `BARRE_BOUGER'
		attribute Result := ({like BARRE_BOUGER}).default end --| Remove line when Void Safety is properly set

end
