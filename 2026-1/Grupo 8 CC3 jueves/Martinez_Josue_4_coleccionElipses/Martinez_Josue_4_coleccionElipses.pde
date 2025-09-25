import gifAnimation.*;
import processing.sound.*;
SoundFile audio;
Gif animacion;
Elipse e1;//Definimos nuestro objeto
Elipse [] elipses = new Elipse[3]; //Array, Arreglo o Colección
color [] coleccionColores = {#6491B7, #E8371C, #4B50A5, #EAC739};
int posX, posY;
int diametro;
int intensidadVibracion;
int velX, velY;
void setup() {
  //fullScreen();
  background(0);
  size(500, 500);
  audio = new SoundFile(this, "oia.wav");
  animacion = new Gif (this, "oia-uia.gif");

  //Generar repeticiones de forma controlada
  for (int i = 0; i < elipses.length; i++) {
    diametro = int(random(30, 150));
    velX = int(random(1, 3));
    velY = int(random(1, 3));
    posX = int(random(diametro, width-diametro));
    posY = int(random(diametro, height-diametro));
    intensidadVibracion = int(random(1, 10));
    elipses[i] = new Elipse(posX, posY, diametro, intensidadVibracion, coleccionColores[i%4], velX, velY, audio, animacion);
  }
  e1 = new Elipse();//Creamos a un nuevo Elipse
}

void draw() {
  int contadorDentro=0;
  background(0);
  noStroke();
  for (int i = 0; i < elipses.length; i++) {
    if (elipses[i].dentro) {
      elipses[i].dibujar();
      elipses[i].vibrar();
      elipses[i].limitar();
    }
    if (elipses[i].dentro) {          // verificamos flag de cada objeto
      contadorDentro++;
    }
    if (contadorDentro < 1 && frameCount >=30) {
      noLoop();
    }
    println(contadorDentro);
    println(frameCount);
  }
}
//Hacer por separado las funciones
// Verbo en tiempo infinitivo | ar, er, ir
