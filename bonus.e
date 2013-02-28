note
	description: "Summary description for {BONUS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BONUS

inherit
	FORME_OBJET

	IMAGE

feature -- Access

	BONUS_BOUGER: DEPLACEMENT
			-- `BONUS_BOUGER'
		attribute Result := ({like BONUS_BOUGER}).default end --| Remove line when Void Safety is properly set

end
