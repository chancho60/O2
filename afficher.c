#include "SDL.h" 


 
int main(int argc, char **argv) 
{ 
     SDL_Surface *screen;    // Surface representant le contenu de la fenetre
     SDL_Surface *bmp;       // Surface representant l'image
     SDL_Rect    targetarea; // Coordonnees de l'image dans la fenetre
      
     /* Initialiser la librairie */ 
     SDL_Init(SDL_INIT_VIDEO); 
     /* Charger l'image test.bmp dans un SDL_Surface */ 
     bmp = SDL_LoadBMP("test.bmp"); 

     /* Initialiser la fenetre */ 
     screen = SDL_SetVideoMode(bmp->w, bmp->h, 32, SDL_SWSURFACE); 
     
      
     /* Coordonnees de l'image dans la fenetre */ 
     targetarea.x = 0; 
     targetarea.y = 0; 
     targetarea.w = bmp->w; 
     targetarea.h = bmp->h; 
      
     /* Place l'image sur la fenetre */ 
     SDL_BlitSurface(bmp, NULL, screen, &targetarea); 

     /* Met la fenetre a jour (double buffer) */ 
     SDL_Flip(screen); 
 
     /* Attend avant de terminer l'application */ 
     SDL_Delay(2000); 
     
     return 0; 
}
