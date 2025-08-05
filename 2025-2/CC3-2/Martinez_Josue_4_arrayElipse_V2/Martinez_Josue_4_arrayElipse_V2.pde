import gifAnimation.*;
import processing.sound.*;
SoundFile audio;//Creamos los objetos para audio y animación gif
Gif animacion;
//Creamos un array del objeto Elipse, definiendo su tamaño dentro de las llaves
Elipse [] elipses = new Elipse [50];
float posX, posY, diametro, velocidad;
int margen = 25;
int colorActual;
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  audio = new SoundFile(this, "oia.mp3");
  animacion = new Gif (this, "oia-uia.gif");
  audio.loop(); //Reproducelo y repitelo
  animacion.loop(); //Muestra la animación y repítela
  for (int i = 0; i < elipses.length; i++) {
    posX = random(margen, width-margen);
    posY = random(margen, height-margen);
    diametro = random(25, 75);
    velocidad = random(3, 8);
    colorActual = int(random(360));
    elipses[i] = new Elipse(posX, posY, diametro, velocidad, colorActual, animacion); //Definimos las características de la elipseUno
  }
}

void draw() {
  background(50);
  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
    elipses[i].mostrarImagen();
  }
}
