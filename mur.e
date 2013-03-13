note
	description: "Summary description for {MUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MUR

inherit
	FORME_OBJET

	IMAGE
create
	initialiser
feature
	l_target_area_mur_haut,l_target_area_mur_bas, l_bmp:POINTER
	l_blit_surface:INTEGER
	initialiser
		local
			l_memory_manager:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
		do
			create l_memory_manager.default_create
			l_image_nom := mur
			create l_c_string_bmp.make (l_image_nom)
			l_target_area_mur_haut := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_target_area_mur_bas := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
		end

	mur_haut(l_window:POINTER)
		do
			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area_mur_haut, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area_mur_haut, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area_mur_haut, mur_haut_X)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area_mur_haut, mur_haut_Y)

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area_mur_haut)
		end

	mur_bas(l_window:POINTER)
		do
			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area_mur_bas, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area_mur_bas, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area_mur_bas, mur_bas_X)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area_mur_bas, mur_bas_Y)

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area_mur_bas)
		end
end
