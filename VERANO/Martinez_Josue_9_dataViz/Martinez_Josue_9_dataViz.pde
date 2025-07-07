import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float posX, posY;
float diametro = 20;
int colorActual;
color colorA = color(75, 157, 68);
color colorB = color(222, 216, 96);
Minim analizadorAudio;
AudioInput microfono;

void setup() {
  //size(600, 600);
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
  posX = 0;
  posY = height/2;
  noStroke();
  background(0);
}
void draw() {
  posX = frameCount%width;
  fill(0, 3);
  rect(0, 0, width, height);
  float amplitud = microfono.left.level();
  posY = map(amplitud, 0.01, 0.3, height-diametro-20, diametro+20);
  //colorActual = int(map(amplitud, 0.015, 0.3, 147, 0));
  float proporcionColor = map(amplitud, 0.015, 0.3, 0, 1);
  color colorMapeado = lerpColor(colorA,colorB,proporcionColor);
  fill(colorMapeado);
  ellipse(posX, posY, diametro, diametro);
}
