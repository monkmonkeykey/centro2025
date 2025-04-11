import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioInput microfono;
Minim analizadorAudio;

float posX, posY; //Definir la posición de nuestra figura
int diametro = 15;
color colorGrafica = #1B65E0;
float factorNoise = 0.02; //Define el movimiento
float offSet = 0.0; //Simulará un contador
void setup() {
  size(600, 600);
  frameRate(120);
  posX = width/2;
  posY = height/2;
  analizadorAudio = new Minim (this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
  noStroke();
  background(0);
}

void draw() {
  float amplitud = microfono.left.level();
  amplitud = map(amplitud, 0.025, 0.2, 0.002, 0.07); //redimensionamos los datos

  fill(0, 7);
  rect(0, 0, width, height);
  posX = frameCount%width+diametro/2;
  offSet = offSet + amplitud; //Incrementar constantemente el valor de offSet
  posY = noise(offSet) * height;
  fill(colorGrafica);
  ellipse(posX, posY, diametro, diametro);
}
