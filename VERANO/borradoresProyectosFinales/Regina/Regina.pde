import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.video.*;

int escala = 10;
int columnas, filas;
Capture webcam;
String texto = "nia/.,";
int colorActual;
color colorA = color(32, 2, 107); //Color inicial, 
color colorB = color(124, 202, 237); //Color final.

color colorSuavizado; // nuevo color interpolado
color colorSuavizadoFondo;
Minim analizadorAudio;
AudioInput microfono;
void setup() {
  size(1280, 720);
  columnas = width/ escala;
  filas = height / escala;
  textAlign(CENTER, CENTER);
  webcam = new Capture (this, columnas, filas);
  webcam.start();
  analizadorAudio = new Minim(this);
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
  background(0);
}

void draw() {
  background(0);
  //fill(0, 15);
  // rect(0, 0, width, height);
  if (webcam.available()) {
    webcam.read();
  }
  float amplitud = microfono.left.level();
  float proporcionColor = map(amplitud, 0.015, 0.02, 0, 1);
  color colorMapeado = lerpColor(colorA, colorB, proporcionColor);
  color colorObjetivo = lerpColor(colorA, colorB, proporcionColor);

  // Suavizado del cambio de color
  colorSuavizado = lerpColor(colorSuavizado, colorObjetivo, 0.3);
  println(webcam.width);
  for (int x = 0; x < webcam.width; x++ ) {
    for (int y = 0; y < webcam.height; y++ ) {
      int indice = x + y * webcam.width;
      color c = webcam.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float brillo = (r + g + b) / 3;
      int indiceLetras = int(map(brillo, 0, 255, texto.length()-1, 0));
      String letraActual = texto.substring(indiceLetras, indiceLetras + 1);
      fill(colorSuavizado);
      text(letraActual, x * escala, y * escala);
    }
  }
}
