note
	description: "Summary description for {BALLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BALLE

inherit
	FORME_OBJET

	IMAGE

feature -- Access

	BALLE_BOUGER: DEPLACEMENT
			-- `BALLE_BOUGER'
		attribute Result := ({like BALLE_BOUGER}).default end --| Remove line when Void Safety is properly set

end
