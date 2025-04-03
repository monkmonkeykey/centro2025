import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim analizadorAudio;
AudioInput microfono;

PImage fondo, bird; // Variables para imagen
float posX, posY;  // Variables para posición
float factorNoise = 0.01; // Intensidad de movimiento
float offSet; // Inicializado en 0
int diametro = 15;

void setup() {
  size(900, 504); // Dimensiones a partir de la imagen de fondo
  noStroke();
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height); // Limpieza con transparencia leve

  float amplitud = microfono.left.level();

  // Mapear amplitud a un rango más útil para desplazar desde el centro
  float desplazamiento = map(amplitud, 0.025, 0.2, 0, height);

  offSet += factorNoise;

  // Movimiento desde el centro de pantalla, arriba o abajo según noise
  float direccion = map(noise(offSet), 0, 1, -1, 1); // Da valores entre -1 y 1
  posY = height/2 + (direccion * desplazamiento);

  // Movimiento horizontal cíclico
  posX = (frameCount) % width + diametro;
  posX = map(posX, diametro, width + diametro, diametro/2, width + diametro);

  fill(255, 0, 0);
  ellipse(posX, posY, diametro, diametro);
}
