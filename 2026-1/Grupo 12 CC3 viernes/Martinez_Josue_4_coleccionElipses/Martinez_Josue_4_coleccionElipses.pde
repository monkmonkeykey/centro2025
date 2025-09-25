import gifAnimation.*;

import processing.sound.*;

Elipse [] elipses = new Elipse[5];
float posX, posY;
float diametro;
float velX;
float velY;
color [] misColores = {#6491B7, #E8371C, #4B50A5, #EAC739}; //Array = Arreglo | Colección de colores
SoundFile audio;
String texto = "Josué";
Gif animacion;//Definimos el dato para el gif
void setup() {
  //fullScreen();
  size(800, 800);
  audio = new SoundFile(this, "oia.wav");
  animacion = new Gif(this, "oia-uia.gif");
  animacion.loop();
  for (int i = 0; i < elipses.length; i++) {
    //Valores aleatorios para mis elipses
    diametro = random(50, 150);
    posX = random(diametro, width-diametro);
    posY = random(diametro, height-diametro);
    velX = random(0.5, 0.7);
    velY = random(0.5, 0.7);
    elipses[i] = new Elipse(posX, posY, diametro, velX, velY, misColores[i%misColores.length], audio, texto, animacion);
  }
  noStroke();//No contorno o borde
}

void draw() {
  background(0);
  for (int i = 0; i < elipses.length; i++) {
    //elipses[i].dibujar();

    elipses[i].rebotar();
    elipses[i].desplazar();
    elipses[i].dibujarAnimacion();
    elipses[i].textualidad();
  }
}

// Acción concreta | Conjugar un verbo en infinitivo = Terminación ar, er, ir
