note
	description: "Code du deplacement des sprites."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	DEPLACEMENT

feature
	bouton_presse(l_event:POINTER l_barre:BARRE)
		local
			l_keyboard_event, l_keysym:POINTER
		do
			l_keyboard_event := {SDL_WRAPPER}.get_SDL_EventKey(l_event)
			l_keysym := {SDL_WRAPPER}.get_SDL_keysym(l_keyboard_event)
			if-----down
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_DOWN
			then
				if
					l_barre.get_player1_y < 500
				then
					l_barre.set_player1_Y(10)
				end

			end
			if----up
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_UP
			then
				if
					l_barre.get_player1_y > 20
				then
					l_barre.set_player1_Y(-10)
				end
			end
	end

	balle(l_balle:BALLE l_barre1:BARRE l_barre2:BARRE)
		local
			l_colision_32:INTEGER_32
		do  ---vérifications
			if
				l_balle.get_droite
			then
				if
					l_balle.get_X+l_balle.get_vitesse > 1220
				then
					if
						l_barre2.get_player1_y < (l_balle.get_player1_y+30) and l_barre2.get_player1_y > (l_balle.get_player1_y - 200)
					then
						l_colision_32 := l_balle.get_X-(1220-(l_balle.get_vitesse-(1220-l_balle.get_x)))
						l_balle.set_x(l_colision_32.as_integer_16)
						l_balle.set_droite (false)
					end
				end
			end
			if
				l_balle.get_droite = false
			then
				if
					l_balle.get_X-l_balle.get_vitesse < 30
				then
					l_colision_32 := l_balle.get_X-(30+(l_balle.get_vitesse-(l_balle.get_x-30)))
					l_balle.set_x (l_colision_32.as_integer_16)
					l_balle.set_droite (true)
				end
			end



			if
				l_balle.get_monte
			then
				if
					l_balle.get_player1_Y < 40
				then
					l_balle.set_monte (false)
				end
			end
			if
				l_balle.get_monte = false
			then
				if
					l_balle.get_player1_Y > 670
				then
					l_balle.set_monte (true)
				end
			end


			 ---déplacement
			 if
			 	l_balle.get_droite
			 then
			 	l_balle.set_x (l_balle.get_vitesse)
			 end
			 if
			 	l_balle.get_droite = false
			 then
			 	l_balle.set_x (-l_balle.get_vitesse)
			 end

			 if
			 	l_balle.get_monte
			 then
			 	l_balle.set_player1_Y (-l_balle.get_vitesse)
			 end
			 if
			 	l_balle.get_monte = false
			 then
			 	l_balle.set_player1_Y (l_balle.get_vitesse)
			 end
		end
end
