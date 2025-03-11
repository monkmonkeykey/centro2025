import gifAnimation.*;

import gifAnimation.*;
import processing.sound.*;
SoundFile audio;//Llamar a un objeto
Gif gatito;
Elipse [] elipses = new Elipse [50]; //Array de elipses y definimos el tamaño del array.
float posX, posY, diametro, velocidad;
int colorActual;
String nombres [] = {"Josué", "Estrella", "Renee"};
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  audio = new SoundFile (this, "oia.mp3");
  audio.loop();
  gatito = new Gif(this, "oia-uia.gif");
  gatito.loop();
  for (int i = 0; i < elipses.length; i++) {
    diametro = random(5, 100);
    posX = random(diametro, width-diametro);
    posY = random(diametro, height-diametro);
    velocidad = random(3, 12);
    colorActual = int(random(360)); //Obtener los colores en HSB aleatorios
    elipses[i] = new Elipse(posX, posY, diametro, velocidad, colorActual, gatito, nombres[i%nombres.length]);
  }
  noStroke();
}

void draw() {
  background(100);
  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
    elipses[i].dibujarImagen();
    elipses[i].dibujarTexto();
    
  }
}
