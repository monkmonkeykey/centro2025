import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage fondo;
int posX, posY;
color [] coloresAmplitudSonido = {
  color(0, 0, 200), //índice 0
  color(255, 0, 200)// índice 1
};
int diametro = 5;
Minim analizadorAudio;
AudioInput microfono;

void setup() {
  size(1280, 720);
  fondo = loadImage("3.jpg");
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);

  noStroke();
  frameRate(500);
  rectMode(CENTER);
  background(0);
}
void draw() {
  float amplitud = microfono.left.level();
  float intensidadColor = map(amplitud, 0.015, 0.2, 0, coloresAmplitudSonido.length-1);
  intensidadColor = constrain(intensidadColor, 0, coloresAmplitudSonido.length-1);
  //background(coloresAmplitudSonido[int(intensidadColor)]);

  posX = int(random(width));
  posY = int(random(height));

  fill(coloresAmplitudSonido[int(intensidadColor)]);
  ellipse(posX, posY, diametro, diametro);
  //rect(posX, posY, diametro, diametro);
}
