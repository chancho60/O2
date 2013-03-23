note
	description: "Summary description for {FORME_OBJET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FORME_OBJET
inherit
	GAME
create
	creer_forme
feature
	player1_Y:INTEGER_16
	player1_X:INTEGER_16
--	player2_Y:INTEGER_16
--	player2_X:INTEGER_16

	creer_forme(l_X:INTEGER_16 l_Y:INTEGER_16)
		do
			player1_Y:=l_Y
			player1_X:=l_X
--			player2_Y:=300
--			player2_X:=1250
		end


		----------------------------murs
	mur_haut_X:INTEGER_16
		do
			result:=0
		end
	mur_haut_Y:INTEGER_16
		do
			result:=0
		end
	mur_bas_X:INTEGER_16
		do
			result:=0
		end
	mur_bas_Y:INTEGER_16
		do
			result:=700
		end


		---------------------------------------------player1
	set_player1_Y(l_player1_Y:INTEGER_16)
		do
			player1_Y := player1_Y+l_player1_Y
		end
	get_player1_Y:INTEGER_16
		do
			result := player1_Y
		end
--------------------------------------------------player2		
--	set_player2_Y(l_player2_Y:INTEGER_16)
--		do
--			player2_Y := player2_Y+l_player2_Y
--		end
--	get_player2_Y:INTEGER_16
--		do
--			result := player2_Y
--		end
end
