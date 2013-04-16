note
	description: "Code de la balle. (Image de la balle)"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	BALLE

inherit
	FORME_OBJET

	IMAGE
create
	creer_balle

feature -- Access
		vitesse:INTEGER_16
		monte, droite:BOOLEAN


		creer_balle(l_X:INTEGER_16 l_Y:INTEGER_16)
		do
			creer_forme(l_X, l_Y, "Ressources/balle_jeu.bmp")
			droite := true
			vitesse := 10
		end

		set_vitesse(l_vitesse_temp:INTEGER_16)
			do
				vitesse := l_vitesse_temp
			end
		set_monte(l_monte_temp:BOOLEAN)
			do
				monte := l_monte_temp
			end
		set_droite(l_droite_temp:BOOLEAN)
			do
				droite := l_droite_temp
			end
end
