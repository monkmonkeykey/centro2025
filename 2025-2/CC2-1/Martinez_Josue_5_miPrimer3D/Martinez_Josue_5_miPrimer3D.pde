import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage mario; //Variable para image
float escala, rotacion;
Minim analizadorAudio;
AudioInput microfono;
void setup() {
  size(300, 300);
  mario = loadImage("mario.png");
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
  rectMode(CENTER);
  imageMode(CENTER);
  //rect(20, 20, 40, 40);
  //con translate defino un nuevo origen en coordenadas
  //150,150
  pushMatrix(); //Desde aquí comenzaré mis transformaciones
  translate(width/2, height/2);
  //rect(20, 20, 40, 40);
  popMatrix(); //Donde terminan mis transformaciones
  //rect(40, 40, 40, 40);
}

void draw() {
  float amplitud = microfono.left.level();
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  escala = map(amplitud, 0.025, 0.2, 0.1, 0.75);
  rotacion = map(frameCount%120, 0, 120, 0, 360);
  scale(escala);
  rotate(radians(0));
  image(mario, 0, 0);
  popMatrix();
}
