note
	description: "Banque des noms des images."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	IMAGE

feature -- Access
	background:STRING
		do
			result := "Ressources/background_jeu.bmp"
		end
	mur:STRING
		do
			result := "Ressources/mur_jeu.bmp"
		end
	player1:STRING
		do
			result := "Ressources/player1_jeu.bmp"
		end
	balle:STRING
		do
			result := "Ressources/balle_jeu.bmp"
		end

end
