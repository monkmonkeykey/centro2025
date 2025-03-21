import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;
SoundFile [] audios; //Definimos el objeto
Minim analizadorAudio;
AudioInput microfono;
Mancha [] manchitas = new Mancha [500];
float x, y, diametro, velocidad;
PImage imagen;
int numAudios = 5;
void setup() {
  size(1280, 720);
  noStroke();
  imagen = loadImage("3.jpg");
  audios = new SoundFile[numAudios]; //Crear el objeto
  analizadorAudio = new Minim (this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);

  for (int i = 0; i <numAudios; i++) {
    audios[i] = new SoundFile(this, (i+1) + ".aif"); //Añadimos archivos al obj
  }
  for (int i = 0; i < manchitas.length; i++) {
    diametro = random(5, 15);
    x = random(diametro/2, width-diametro/2);
    y = random(diametro/2, height-diametro/2);
    velocidad = random(-2, 2);
    manchitas[i] = new Mancha (x, y, diametro, velocidad, imagen, audios[i%numAudios]);
  }
}
void draw() {
  colorMode(RGB);
  float amplitud = microfono.left.level();
  amplitud = map(amplitud, 0.015, 0.175, 0, 100);

  fill(0, 15);
  rect(0, 0, width, height);
  for (int i = 0; i < manchitas.length; i++) {
    manchitas[i].alpha = amplitud;
    manchitas[i].mover();
    manchitas[i].dibujar();
    if (manchitas[i].colision == true) {
      manchitas[i].reproducir();
    }
  }
}
