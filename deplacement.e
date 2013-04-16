note
	description: "Code du deplacement des sprites."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	DEPLACEMENT

feature
	bouton_presse(l_event:POINTER l_barre:FORME_OBJET)
		local
			l_keyboard_event, l_keysym:POINTER
		do
			l_keyboard_event := {SDL_WRAPPER}.get_SDL_EventKey(l_event)
			l_keysym := {SDL_WRAPPER}.get_SDL_keysym(l_keyboard_event)
			if-----down
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_DOWN
			then
				if
					l_barre.y < 500
				then
					l_barre.set_player1_Y(10)
				end

			end
			if----up
				{SDL_WRAPPER}.get_SDL_sym(l_keysym) = {SDL_WRAPPER}.SDLK_UP
			then
				if
					l_barre.Y > 20
				then
					l_barre.set_player1_Y(-10)
				end
			end
	end

	balle(l_balle:BALLE l_barre1:FORME_OBJET l_barre2:FORME_OBJET)
		local
			l_colision_32:INTEGER_32
		do  ---vérifications
			if
				l_balle.droite
			then
				if
					l_balle.X+l_balle.vitesse > 1220
				then
					if
						l_barre2.Y < (l_balle.Y+30) and l_barre2.Y > (l_balle.Y - 200)
					then
						l_colision_32 := l_balle.X-(1220-(l_balle.vitesse-(1220-l_balle.X)))
						l_balle.set_x(l_colision_32.as_integer_16)
						l_balle.set_droite (false)
					end
				end
			end
			if
				l_balle.droite = false
			then
				if
					l_balle.X-l_balle.vitesse < 30
				then
					if
						l_barre1.Y < (l_balle.Y+30) and l_barre1.Y > (l_balle.Y - 200)
					then
						l_colision_32 := l_balle.X-(30+(l_balle.vitesse-(l_balle.X-30)))
						l_balle.set_x (l_colision_32.as_integer_16)
						l_balle.set_droite (true)
					end
				end
			end



			if
				l_balle.monte
			then
				if
					l_balle.y-l_balle.vitesse < 30
				then
				--	l_colision_32 := l_balle.Y-(
					l_balle.set_monte (false)
				end
			end

			if
				l_balle.monte = false
			then
				if
					l_balle.Y > 670
				then
					l_balle.set_monte (true)
				end
			end


			 ---déplacement
			 if
			 	l_balle.droite
			 then
			 	l_balle.set_x (l_balle.vitesse)
			 end
			 if
			 	l_balle.droite = false
			 then
			 	l_balle.set_x (-l_balle.vitesse)
			 end

			 if
			 	l_balle.monte
			 then
			 	l_balle.set_player1_Y (-l_balle.vitesse)
			 end
			 if
			 	l_balle.monte = false
			 then
			 	l_balle.set_player1_Y (l_balle.vitesse)
			 end
		end
end
