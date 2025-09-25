import gifAnimation.*;
import processing.sound.*;
Elipse [] misElipses = new Elipse[10]; //Array, arreglo o colección de un dato
int posX, posY;
int diametro;
int velX;
int velY;
color [] misColores = {#D84646, #4678D8, #E3DC5E, #E37F5E}; //Colección de colores
SoundFile audio;
Gif animacion;

void setup() {
  fullScreen(); //Vamos a pantalla completa
 // size(400, 400);
  audio = new SoundFile(this, "oia.mp3");//Cargar el audio
  animacion = new Gif (this, "oia-uia.gif");//Cargamos el gif
  animacion.loop();
  //size(800, 800);
  for (int i = 0; i < misElipses.length; i++) {
    diametro = int(random(50, 150));
    posX = int(random(diametro, width-diametro));
    posY = int(random(diametro, height-diametro));
    velX = int(random(-5, 5));
    velY = int(random(-5, 5));
    misElipses[i] = new Elipse(posX, posY, diametro, velX, velY, misColores[i%misColores.length], audio);
  }
}


void draw() {
  noStroke();
  background(0);
  //Llamamos a la funciones, acciones, métodos que creamos
  for (int i = 0; i < misElipses.length; i++) {
    //misElipses[i].dibujar();
    misElipses[i].dibujarGif();
    misElipses[i].mover();
    misElipses[i].rebotar();
  }
}
