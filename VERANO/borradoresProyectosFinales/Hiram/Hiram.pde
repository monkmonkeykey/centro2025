import processing.sound.*;

PImage [] gaviotas = new PImage [10];
SoundFile [] audiosDelfin = new SoundFile[3];
int posX, posY;
boolean dibujandoDelfin = false;
int contadorFrameDelfin;
PImage fondo;
int audioActual;


void setup() {
  size(1280, 960);
  //fullScreen();
  frameRate(24);
  fondo = loadImage("Ocean Horizon.jpg");

  /*for (int i = 0; i < audiosDelfin.length; i++) {
   audiosDelfin[i] = new SoundFile(this, "gaviotas"+str(i+1)+ ".mp3");
   }
   */
  fondo.resize(fondo.width*2, fondo.height*2);

  for (int i = 0; i < gaviotas.length; i++) {
    gaviotas[i] = loadImage("218705790c734df9892bae3218df71b1ayctZ2zfqZNnrHNF-" + str(i) + ".png");
  }
}

void draw() {
  imageMode(CORNER);
  image(fondo, 0, 0);
  posX = mouseX;
  posY = mouseY;
  // dibujaDelfin();
  if (dibujandoDelfin == true) {
    dibujaDelfin();
  } else {
  }
}

void dibujaDelfin() {
  imageMode(CENTER);
  //audioActual = int(random(3));

  // audiosDelfin[audioActual].play();
  // audiosDelfin[audioActual].amp(0.1);

  image(gaviotas[frameCount%gaviotas.length], posX, posY);
  contadorFrameDelfin++;
  if (contadorFrameDelfin >= gaviotas.length) {
    contadorFrameDelfin = 0;
    dibujandoDelfin = false;
  }
}

void mousePressed() {
  dibujandoDelfin = true;
}
