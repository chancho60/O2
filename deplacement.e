note
	description: "Summary description for {DEPLACEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DEPLACEMENT

feature
	bouton_presse(l_event:POINTER l_barre:BARRE l_up:NATURAL_8 l_down:NATURAL_8)
		do
			if-----down
				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) = l_down
			then
				if
					l_barre.get_player1_y < 500
				then
					l_barre.set_player1_Y(10)
				end

			end
			if----up
				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) =l_up
			then
				if
					l_barre.get_player1_y > 20
				then
					l_barre.set_player1_Y(-10)
				end
			end

	balle_deplacement(l_balle:BALLE l_barre1:BARRE l_barre2:BARRE)
		do
			if
				l_balle.get_droite = true
			then
				if
					l_barre2.get_player1_Y > (l_balle.get_player1_Y+30) and l_barre2.get_player1_Y < (l_balle.get_player1_Y - 230) and l_balle.get_player1_Y = 1250
				then
					print ("but!!!!!!!!")
				end
				l_balle.set_player1_X(10)
			end
		end

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--------------------------------------ZONE-DE-TEST-------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


--			if
--				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) = 30
--			then
--				if
--					l_barre.get_player1_y < 500
--				then
--					l_barre.set_player1_Y(10)
--				end

--			end
--			if
--				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) = 16
--			then
--				if
--					l_barre.get_player1_y > 20
--				then
--					l_barre.set_player1_Y(-10)
--				end
--			end
	end
end
