import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioInput microfono; //Creamos un objeto que usaremos como entrada de audio
Minim analizadorAudio; //Objeto que nos permite analizar el audio
float posX, posY;
int diametro = 10;
color colorActual;
color colorA = #4CE52E;//color intensidad baja
color colorB = #E54D2E;//color intensidad alta

void setup() {
  size(600, 600);
  //Inicia el analizador de audio
  analizadorAudio = new Minim (this);
  //Inicializar a nuestro microfono
  microfono = analizadorAudio.getLineIn(Minim.MONO, 512);
  posX = width/2;
  posY = height/2;
  background(0);
}
void draw() {
  noStroke();
  posX = frameCount%width-diametro/2;
  float amplitud = microfono.left.level();//Obtenemos la amplitud del mic
  //Situar a apartir del volumen a nuestra elipse
  posY = map(amplitud, 0.002, 0.2, height-diametro, diametro);
  float intensidadColor = map(amplitud, 0.002, 0.2, 0, 1 );
  color colorActual = lerpColor(colorA, colorB, intensidadColor);
  fill(colorActual);
  ellipse(posX, posY, diametro, diametro);
}
