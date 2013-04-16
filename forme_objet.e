note
	description: "Code des positions des sprites."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	FORME_OBJET
inherit
	GAME
create
	creer_forme
feature
	Y:INTEGER_16
	X:INTEGER_16
	target_area, l_bmp:POINTER
	nom:STRING

	creer_forme(l_X:INTEGER_16 l_Y:INTEGER_16 l_nom:STRING)
		local
			l_memory_manager:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface:INTEGER
		do
			create l_memory_manager.default_create
			create l_c_string_bmp.make (l_nom)
			target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
			Y:=l_Y
			X:=l_X
			nom:=l_nom
		end
		---------------------------------------------player
	set_player1_Y(l_player1_Y:INTEGER_16)
		do
			Y := Y+l_player1_Y
		end
	set_X(l_player1_X:INTEGER_16)
		do
			X := X+l_player1_X
		end

end
