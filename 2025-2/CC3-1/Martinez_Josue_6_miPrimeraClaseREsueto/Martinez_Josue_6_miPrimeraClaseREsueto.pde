import gifAnimation.*;
import processing.sound.*;
SoundFile audio;//Llamar a un objeto

Elipse [] elipses = new Elipse [1000]; //Array de elipses y definimos el tamaño del array.
float posX, posY, diametro, velocidad;
int colorActual;
String nombreImagen = "oia-uia.gif";
PImage imagen;
Gif gatito;
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  audio = new SoundFile (this, "oia.mp3");
  audio.loop();
  gatito = new Gif(this, "oia-uia.gif");
  imagen = gatito;
  for (int i = 0; i < elipses.length; i++) {
    diametro = random(5, 100);
    posX = random(diametro, width-diametro);
    posY = random(diametro, height-diametro);
    velocidad = random(3, 12);
    colorActual = int(random(360)); //Obtener los colores en HSB aleatorios

    elipses[i] = new Elipse(posX, posY, diametro, velocidad, colorActual, gatito);
  }
  noStroke();
}

void draw() {
  background(100);
  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
    elipses[i].dibujarImagen();
  }
}
