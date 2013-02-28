note
	description: "Summary description for {SDL_WRAPPER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SDL_WRAPPER

feature -- Functions -

	frozen SDL_Init (flags: NATURAL_32): INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--int SDL_Init(Uint32 flags);
		external
			"C (Uint32) : int | <SDL.h>"
		alias
			"SDL_Init"
		end
	frozen SDL_LoadBMP (file: POINTER): POINTER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface *SDL_LoadBMP(const char *file);
		external
			"C (const char *) : SDL_Surface *| <SDL.h>"
		alias
			"SDL_LoadBMP"
		end

	frozen SDL_SetVideoMode (width, height, bitsperpixel:INTEGER; flags:NATURAL_32):POINTER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (int, int, int, Uint32):struct SDL_Surface * | <SDL.h>"
		alias
			"SDL_SetVideoMode"
		end

	frozen SDL_BlitSurface (src, srcrect, dst, dstrect: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (struct SDL_Surface *, struct SDL_Rect *, struct SDL_Surface *, struct SDL_Rect *) : int | <SDL.h>"
		alias
			"SDL_BlitSurface"
		end

	frozen SDL_Flip (screen: POINTER):INTEGER
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (SDL_Surface *) : int | <SDL.h>"
		alias
			"SDL_Flip"
		end

	frozen SDL_Delay (ms: NATURAL_32)
			-- Cree un nouveau systeme de decompression JPEG avec `flags'.
			--SDL_Surface* SDL_SetVideoMode(int width, int height, int bitsperpixel, Uint32 flags);
		external
			"C (Uint32)| <SDL.h>"
		alias
			"SDL_Delay"
		end

	frozen SDL_Quit()
		external
			"C | <sdl.h>"
		alias
			"SDL_Quit"
		end


feature -- Structure Setter

	frozen set_SDL_target_area_H (SDL_Rect: POINTER; value: INTEGER)
			-- Modifie le champ h de la structure `SDL_Surface' par la valeur `h'.
		external
			"C [struct <sdl.h>] (struct SDL_Rect, Uint16)"
		alias
			"h"
	end

	frozen set_SDL_target_area_W (SDL_Rect: POINTER; value: INTEGER)
			-- Modifie le champ w de la structure `SDL_Surface' par la valeur `h'.
		external
			"C [struct <sdl.h>] (struct SDL_Rect, Uint16)"
		alias
			"w"
	end

	frozen set_SDL_target_area_X (SDL_Rect: POINTER; value: INTEGER_16)
			-- Modifie le champ h de la structure `SDL_Surface' par la valeur `h'.
		external
			"C [struct <sdl.h>] (struct SDL_Rect, Sint16)"
		alias
			"x"
	end

	frozen set_SDL_target_area_Y (SDL_Rect: POINTER; value: INTEGER_16)
			-- Modifie le champ w de la structure `SDL_Surface' par la valeur `h'.
		external
			"C [struct <sdl.h>] (struct SDL_Rect, Sint16)"
		alias
			"y"
	end

 feature -- Structure Getter

	frozen get_bmp_h (SDL_Surface:POINTER):INTEGER
			-- Le champ h de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface): int"
		alias
			"h"
		end
	frozen get_bmp_w (SDL_Surface:POINTER):INTEGER
			-- Le champ w de la structure `SDL_Surface'
		external
			"C [struct <SDL.h>] (struct SDL_Surface): int"
		alias
			"w"
		end

feature --constante
	frozen SDL_INIT_VIDEO:NATURAL_32
			-- Constante pour valider que
			-- l'entete a ete correctement
			-- lue avec `jpeg_read_header'.
		external
			"C inline use <sdl.h>"
		alias
			"SDL_INIT_VIDEO"
		end

	frozen SDL_SWSURFACE:NATURAL_32
			-- Constante pour valider que
			-- l'entete a ete correctement
			-- lue avec `jpeg_read_header'.
		external
			"C inline use <sdl.h>"
		alias
			"SDL_SWSURFACE"
		end

feature -- Sizeof
	frozen sizeof_SDL_Rect:INTEGER
			-- Constante pour valider que
			-- l'entete a ete correctement
			-- lue avec `jpeg_read_header'.
		external
			"C inline use <SDL.h>"
		alias
			"sizeof(struct SDL_Rect)"
		end

end
