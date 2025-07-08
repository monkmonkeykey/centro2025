import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim analizadorAudio;
AudioInput micrófono;

float posX, posY;
float diametro = 5;

color []coloresAmplitudSonido = {
  color(0, 0, 0), // 0 - 10 dB
  color(255, 255, 255), // 11 - 20 dB    NEGRO
  color(167, 167, 167), // 21 - 30 dB    GRIS CLARO
  color(90, 90, 90), // 31 - 35 dB    GRIS OSCURO
  color(193, 153, 219), // 36 - 40 dB    LILA
  color(252, 234, 20), // 41 - 55 dB    AMARILLO
  color(67, 77, 247), // 56 - 60 dB    AZUL REY
  color(92, 152, 63), // 61 - 65 dB    VERDE
  color(235, 147, 88), // 66 - 70 dB    ROSA PASTEL
  color(51, 175, 143), // 71 - 75 dB    TURQUESA
  color(120, 34, 126), // 76 - 80 dB    VIOLETA
  color(211, 13, 145), // 81 - 85 dB    FUCSIA
  color(245, 239, 131), // 86 - 90 dB    AMARILLO PASTEL
  color(20, 155, 235), // 91 - 95 dB    AZUL
  color(252, 20, 102), // 96 - 100 dB   ROSA ROJO
  color(44, 93, 20), // 101 - 105 dB  VERDE OSCURO
  color(245, 83, 7), // 106 - 110 dB  NARANJA
  color(245, 55, 7), // 111 - 115 dB  NARANJA-ROJO
  color(255, 255, 255), // 116 - 120 dB  ROJO
  color(152, 6, 6), // 121 - 130 dB  ROJO OSCURO
} ;

void setup() {
  fullScreen();
  //size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  analizadorAudio = new Minim(this);
  micrófono = analizadorAudio.getLineIn(Minim.MONO, 2048);
  noStroke();
  background(80);
  println(coloresAmplitudSonido.length);
  for (int i = 0; i < coloresAmplitudSonido.length; i++) {
    fill(coloresAmplitudSonido[i]);
    rect(i*width/coloresAmplitudSonido.length, height-100, width/coloresAmplitudSonido.length, 100);
  }
}

void draw() {

  noStroke();
  float volumen = micrófono.mix.level();
  float dB = 20 * log(volumen + 0.0001) / log(10);
  dB = constrain(dB + 100, 0, 130);  // compensación
  println("Nivel en dB actual:", dB);
  diametro = random(4, 12);
  posX = random(diametro/2, width-diametro/2);
  posY = random(diametro/2, height-100-diametro/2);


  float dBActual = map(dB, 0, 100, 0, coloresAmplitudSonido.length);
  fill(coloresAmplitudSonido[int(dBActual)]);
  ellipse(posX, posY, diametro, diametro);
}

void stop() {
  micrófono.close();
  analizadorAudio.stop();
  super.stop();
}
