import processing.sound.*;

PImage [] delfin = new PImage [15];
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
  for (int i = 0; i < audiosDelfin.length; i++) {
    audiosDelfin[i] = new SoundFile(this, "delfin"+str(i+1)+ ".mp3");
  }
  fondo.resize(fondo.width*2, fondo.height*2);

  for (int i = 0; i < delfin.length; i++) {
    delfin[i] = loadImage("frame_" + str(i) + ".png");
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
  audioActual = int(random(3));

  audiosDelfin[audioActual].play();
  audiosDelfin[audioActual].amp(0.1);

  image(delfin[frameCount%delfin.length], posX, height-delfin[0].height/2);
  contadorFrameDelfin++;
  if (contadorFrameDelfin >= delfin.length) {
    contadorFrameDelfin = 0;
    dibujandoDelfin = false;
  }
}

void mousePressed() {
  dibujandoDelfin = true;
}
