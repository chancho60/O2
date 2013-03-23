note
	description: "Summary description for {BALLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BALLE

inherit
	FORME_OBJET

	IMAGE
create
	creer_balle

feature -- Access

	BALLE_BOUGER: DEPLACEMENT
			-- `BALLE_BOUGER'
		attribute Result := ({like BALLE_BOUGER}).default end --| Remove line when Void Safety is properly set

		l_target_area_player, l_bmp_player:POINTER
		l_blit_surface_player:INTEGER
		l_vitesse:INTEGER
		l_monte, l_droite:BOOLEAN


		creer_balle(l_X:INTEGER_16 l_Y:INTEGER_16)
		local
			l_memory_manager:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
		do
			creer_forme(l_X, l_Y)
			create l_memory_manager.default_create
			l_image_nom := balle
			create l_c_string_bmp.make (l_image_nom)
			l_target_area_player := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp_player := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
		end

		afficher_balle(l_window:POINTER)
		do
			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area_player, {SDL_WRAPPER}.get_bmp_h(l_bmp_player))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area_player, {SDL_WRAPPER}.get_bmp_w(l_bmp_player))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area_player, player1_X)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area_player, player1_Y)

			l_blit_surface_player := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp_player, create {POINTER}, l_window, l_target_area_player)
		end
		get_vitesse:INTEGER
			do
				result := l_vitesse
			end
		get_monte:BOOLEAN
			do
				result := l_monte
			end
		get_droite:BOOLEAN
			do
				result := l_droite
			end
end
