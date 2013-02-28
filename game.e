note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Unnamed", "protocol=URI", "src=http://www.yourwebsite.com"

class
	GAME
inherit
	ARGUMENTS
create
	make
feature -- Access

--	BACKGROUND: IMAGE
--			 `BACKGROUND'
--		attribute Result := ({like BACKGROUND}).default end --| Remove line when Void Safety is properly set

	make
		local
			l_memory_manager, l_target_area, l_bmp, l_window:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
		do
			--| Add your code here
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation à échoué!%N")
			end
			create l_memory_manager.default_create
			l_image_nom := "test.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)

			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)

			l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

			{SDL_WRAPPER}.SDL_Delay(1000)

			l_target_area.memory_free
		end

end
