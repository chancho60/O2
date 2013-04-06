note
	description: "Code des bonus. (Bonus)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

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
