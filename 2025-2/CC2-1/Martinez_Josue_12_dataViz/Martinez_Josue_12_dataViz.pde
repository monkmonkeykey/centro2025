import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float posX, posY; //definimos las variables que usaremos
float diametro = 25;
float colorActual;
Minim analizadorAudio;
AudioInput microfono;

void setup() {
  fullScreen();
  //size(500, 500);
  colorMode(HSB, 360, 100, 100);
  analizadorAudio = new Minim(this);//Inicializar el analizador de audio
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);//guardamos y definimos la entrada de audio en el Mic
  posX = 0;
  posY = height/2;
  noStroke();
  fill(0, 360);
  rect(0, 0, width, height);
}

void draw() {
  posX = frameCount%width;
  fill(0, 1);
  rect(0, 0, width, height);
  float amplitud = microfono.left.level();//obtenemos el valor de amplitud de señal obtenida por el mic
  posY = map(amplitud, 0.01, 0.3, height-diametro-20, diametro+20);
  //diametro = map(amplitud, 0.015, 0.2, 25, 100);
  colorActual = map(amplitud, 0.015, 0.2, 209, 282);
  fill(colorActual, 80, 80);
  ellipse(posX, posY, diametro, diametro);
}
