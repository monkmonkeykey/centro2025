import processing.sound.*;

SoundFile audio;
import gifAnimation.*;
Gif miGif;
Elipse [] elipses = new Elipse [5];
Elipse elipseGanadora;
PImage imagen;
float x;
float y;
float diametro;
float velocidad;
int colorActual;
int elipsesActivas;
String [] nombres = {"Josué", "Fernanda", "Carmen", "Max", "Kevin"};
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  miGif = new Gif(this, "oia-uia.gif");
  miGif.loop();
  audio = new SoundFile(this, "oia.mp3");
  audio.loop();
  //imagen = loadImage();
  noStroke();
  for (int i = 0; i < elipses.length; i++) {
    diametro = random(20, 50);
    x = random (diametro, width-diametro);
    y = random(diametro, height-diametro);
    velocidad = random (3, 15);
    colorActual = int(random(360));
    elipses[i] = new Elipse(x, y, diametro, velocidad, colorActual, nombres[i%nombres.length], miGif); //Definimos las características de la elipseUno
  }
}

void draw() {
  background(50);
  elipsesActivas = 0;
  elipseGanadora = null;
  for (int i = 0; i < elipses.length; i++) {
    if (elipses[i].dibujarActivo) {
      elipses[i].dibujar();
      elipses[i].vibrar();
      elipses[i].desbordar();
      //elipses[i].mostrarNombre();
      elipsesActivas ++;
      elipseGanadora = elipses[i];
    }
  }
  if (elipsesActivas == 1 && elipseGanadora != null) {
    elipseGanadora.vibrarActivo = false;

    elipseGanadora.centrar();
    elipseGanadora.easing();
    elipseGanadora.dibujar();
    elipseGanadora.mostrarNombre();
    elipseGanadora.crecer();
    println("Solo queda una");
  }
  println("Elipses activas: ", elipsesActivas);
}
