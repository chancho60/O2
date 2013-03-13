note
	description: "Summary description for {FORME_OBJET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FORME_OBJET

inherit
	GAME
feature --mur haut---------------------------------------------
	mur_haut_X:INTEGER_16
		do
			result:=0
		end
	mur_haut_Y:INTEGER_16
		do
			result:=0
		end
feature --mur bas----------------------------------------------
	mur_bas_X:INTEGER_16
		do
			result:=0
		end
	mur_bas_Y:INTEGER_16
		do
			result:=700
		end
end
