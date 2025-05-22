import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float diametro, posX, posY; //definimos las variables que usaremos
float colorActual;
Minim analizadorAudio;
AudioInput microfono;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  analizadorAudio = new Minim(this);//Inicializar el analizador de audio
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);//guardamos y definimos la entrada de audio en el Mic
  posX = width/2;
  posY = height/2;
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  float amplitud = microfono.left.level();//obtenemos el valor de amplitud de señal obtenida por el mic
  diametro = map(amplitud, 0.015, 0.2, 25, 100);
  colorActual = map(amplitud, 0.015, 0.2, 209, 282);
  fill(colorActual, 80, 80);
  ellipse(posX, posY, diametro, diametro);
}
