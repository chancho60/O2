note
	description: "Code des positions des sprites."
	author: "Anthony et �tienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	FORME_OBJET
inherit
	GAME
create
	creer_forme
feature
	player1_Y:INTEGER_16
	player1_X:INTEGER_16

	creer_forme(l_X:INTEGER_16 l_Y:INTEGER_16)
		do
			player1_Y:=l_Y
			player1_X:=l_X
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


		---------------------------------------------player
	set_player1_Y(l_player1_Y:INTEGER_16)
		do
			player1_Y := player1_Y+l_player1_Y
		end
	get_player1_Y:INTEGER_16
		do
			result := player1_Y
		end

	set_X(l_player1_X:INTEGER_16)
		do
			player1_X := player1_X+l_player1_X
		end
	get_X:INTEGER_16
		do
			result := player1_X
		end

end
