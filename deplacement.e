note
	description: "Summary description for {DEPLACEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DEPLACEMENT

feature
	bouton_presse(l_event:POINTER, l_barre:BARRE)
		do
			if
				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) = 72
			then
				l_barre.set_player1_Y(2)
			end
			if
				{SDL_WRAPPER}.get_SDL_keyboard_event_keysym(l_event) = 80
			then
				l_barre.set_player1_Y(-2)
		end
	end
end
