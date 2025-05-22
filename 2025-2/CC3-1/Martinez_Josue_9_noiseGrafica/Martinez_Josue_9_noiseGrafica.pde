import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//POO
Minim analizadorAudio;
AudioInput microfono;

float posX, posY; //Definimos datos para posición
float factorNoise = 0.02; // Define la velocidad de movimiento
float offSet; // Contador o la semilla del noise
int diametro = 15;
void setup() {
  size(900, 504);
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);

  imageMode(CENTER); //Define como se dibuja la imagen
  posX = width/2;
  posY = height/2;
  noStroke();
  background(0);
}

void draw() {
  float amplitud = microfono.left.level();
  amplitud = map(amplitud, 0.01, 0.2, 0.002, 0.02);
  fill(0, 1);
  rect(0, 0, width, height);
  offSet = offSet + amplitud; //Contador
  posY = noise(offSet) * height;
  posX = frameCount% width + diametro/2;
  posX = map(posX, 0, width + diametro/2, -diametro, width + diametro/2);
  fill(18, 214, 34);
  ellipse(posX, posY, diametro, diametro);
}
