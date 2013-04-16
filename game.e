note
	description: "Code du jeu principal"
	author: "Anthony et Étienne"
	date: "28 mars 2013"
	revision: "Alpha 3.2"

class
	GAME
inherit
	ARGUMENTS
create
	make_client,
	make_serveur
feature -- Access

	make_client
		local
			l_memory_manager, l_target_area, l_bmp, l_window, l_event:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
			l_img:IMAGE
			l_barre, l_barre2:FORME_OBJET
			l_deplacement:DEPLACEMENT
			l_balle:BALLE
			l_pointage: POINTAGE
			l_point:BOOLEAN
			l_mur_haut, l_mur_bas:FORME_OBJET
			l_client:RESEAU_CLIENT
			l_container:INTEGER_16
		do
			--création des objets et background
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation à échoué!%N")
			end
			create l_memory_manager.default_create
			create l_img
			create l_pointage.creer_pointage
			create l_mur_haut.creer_forme(0,0,"Ressources/mur_jeu.bmp")
			create l_mur_bas.creer_forme(0,700,"Ressources/mur_jeu.bmp")
			create l_barre.creer_forme(10, 300,"Ressources/player1_jeu.bmp")
			create l_barre2.creer_forme(1250, 300,"Ressources/player1_jeu.bmp")
			create l_balle.creer_balle(30, 450)
			create l_client.creer_client
			create l_deplacement
			l_container := 300
			l_image_nom := "Ressources/background_jeu.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)

			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)


			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)

			from -- boucle principale du jeu
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				l_quit := {SDL_WRAPPER}.SDL_QUIT
			until
				l_quit=l_event_type
			loop
				--début gestion du clavier
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_KEYDOWN
				then
					l_deplacement.bouton_presse(l_event, l_barre2)----en attendant le réseau
				end
				--fin gestion du clavier
				io.put_string ("Avant recevoir")
				if
					(l_client.recevoir /= l_container)
				then
					l_barre.set_player1_y (l_client.recevoir - l_barre.y)
					l_container := l_client.recevoir
				end
--				{SDL_WRAPPER}.SDL_Delay(16)
				l_client.envoyer(l_barre2)


--				io.put_string ("Avant envoyer")
--				l_serveur.envoyer(l_barre)
--				{SDL_WRAPPER}.SDL_Delay(30)
--				if
--					(l_serveur.recevoir /= l_container)
--				then
--					l_barre2.set_player1_y (l_barre2.y-l_serveur.recevoir)
--					l_container := l_serveur.recevoir
--				end



				l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)

				l_deplacement.balle (l_balle, l_barre, l_barre2)
				l_img.afficher(l_window, l_mur_haut)
				l_img.afficher(l_window, l_mur_bas)
				l_img.afficher(l_window, l_barre)
				l_img.afficher(l_window, l_barre2)

				if
					l_balle.X > 1220 or l_balle.X < 30
				then
					l_point := true
				end
				if
					l_point = false
				then
					l_img.afficher(l_window, l_balle)
				end



				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

				{SDL_WRAPPER}.SDL_Delay(20)
			end

			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end
			l_client.fin

			l_target_area.memory_free
		end

	make_serveur
		local
			l_memory_manager, l_target_area, l_bmp, l_window, l_event:POINTER
			l_image_nom:STRING
			l_c_string_bmp:C_STRING
			l_blit_surface, l_flip:INTEGER
			l_quit, l_event_type:NATURAL_8
			l_img:IMAGE
			l_barre, l_barre2:FORME_OBJET
			l_deplacement:DEPLACEMENT
			l_balle:BALLE
			l_pointage: POINTAGE
			l_point:BOOLEAN
			l_mur_haut, l_mur_bas:FORME_OBJET
			l_serveur:RESEAU_SERVEUR
			l_container:INTEGER_16
		do
			--création des objets et background
			if
				{SDL_WRAPPER}.SDL_Init({SDL_WRAPPER}.SDL_INIT_VIDEO)<0
			then
				print ("Initialisation de l'initialisation à échoué!%N")
			end
			create l_memory_manager.default_create
			create l_img
			create l_pointage.creer_pointage
			create l_mur_haut.creer_forme(0,0,"Ressources/mur_jeu.bmp")
			create l_mur_bas.creer_forme(0,700,"Ressources/mur_jeu.bmp")
			create l_barre.creer_forme(10, 300,"Ressources/player1_jeu.bmp")
			create l_barre2.creer_forme(1250, 300,"Ressources/player1_jeu.bmp")
			create l_balle.creer_balle(30, 450)
			create l_serveur.creer_reseau
			create l_deplacement
			l_container := 300
			l_image_nom := "Ressources/background_jeu.bmp"
			create l_c_string_bmp.make (l_image_nom)
			l_target_area := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Rect)
			l_bmp := {SDL_WRAPPER}.SDL_LoadBMP(l_c_string_bmp.item)
			l_window := {SDL_WRAPPER}.SDL_SetVideoMode({SDL_WRAPPER}.get_bmp_w(l_bmp), {SDL_WRAPPER}.get_bmp_h(l_bmp),32, {SDL_WRAPPER}.SDL_SWSURFACE)

			{SDL_WRAPPER}.set_SDL_target_area_H(l_target_area, {SDL_WRAPPER}.get_bmp_h(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_W(l_target_area, {SDL_WRAPPER}.get_bmp_w(l_bmp))
			{SDL_WRAPPER}.set_SDL_target_area_X(l_target_area, 0)
			{SDL_WRAPPER}.set_SDL_target_area_Y(l_target_area, 0)


			l_event := l_memory_manager.memory_alloc({SDL_WRAPPER}.sizeof_SDL_Event)

			from -- boucle principale du jeu
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)
				l_quit := {SDL_WRAPPER}.SDL_QUIT
			until
				l_quit=l_event_type
			loop
				--début gestion du clavier
				if
					{SDL_WRAPPER}.SDL_PollEvent(l_event)<1
				then
				end
				l_event_type := {SDL_WRAPPER}.get_SDL_EventType(l_event)

				if
					l_event_type = {SDL_WRAPPER}.SDL_KEYDOWN
				then
					l_deplacement.bouton_presse(l_event, l_barre)
				end
				--fin gestion du clavier
				io.put_string ("Avant envoyer")
				l_serveur.envoyer(l_barre)
--				{SDL_WRAPPER}.SDL_Delay(16)
				if
					(l_serveur.recevoir /= l_container)
				then
					l_barre2.set_player1_y (l_barre2.y-l_serveur.recevoir)
					l_container := l_serveur.recevoir
				end



				l_blit_surface := {SDL_WRAPPER}.SDL_BlitSurface(l_bmp, create {POINTER}, l_window, l_target_area)
				l_deplacement.balle (l_balle, l_barre, l_barre2)
				l_img.afficher(l_window, l_mur_haut)
				l_img.afficher(l_window, l_mur_bas)
				l_img.afficher(l_window, l_barre)
				l_img.afficher(l_window, l_barre2)

				if
					l_balle.X > 1220 or l_balle.X < 30
				then
					l_point := true
				end
				if
					l_point = false
				then
					l_img.afficher(l_window, l_balle)
				end



				l_flip := {SDL_WRAPPER}.SDL_Flip(l_window)

				{SDL_WRAPPER}.SDL_Delay(20)
			end

			if
				{SDL_WRAPPER}.SDL_QuitEvent(l_window)<2
			then
			end
			l_serveur.close_reseau

			l_target_area.memory_free
		end
end
