note
	description: "Banque des noms des images."
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	IMAGE

feature -- Access
	afficher(l_window:POINTER l_forme:FORME_OBJET)
		local
			l_blit_surface:INTEGER
		do
			{SDL_WRAPPER}.set_SDL_target_area_H(l_forme.target_area, {SDL_WRAPPER}.get_bmp_h(l_forme.l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_forme.target_area, {SDL_WRAPPER}.get_bmp_w(l_forme.l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_forme.target_area, l_forme.X)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_forme.target_area, l_forme.Y)

			l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_forme.l_bmp, create {POINTER}, l_window, l_forme.target_area)
		end
end
