import processing.video.*;
Movie video;
PImage imagenDVD;
float posX, posY; //Definiendo variables
float velocidadX = 1.5;
float velocidadY = 1.5;
int colorActual;

void setup() {
  size(640, 360);
  imagenDVD = loadImage("dvd_white.png");
  video = new Movie(this, "video.mp4");
  imageMode(CENTER);
  imagenDVD.resize(imagenDVD.width/8, imagenDVD.height/8);
  video.play();
  video.volume(0); //Muteo el audio del video
  posX = width/2;
  posY = height/2;
}

void movieEvent(Movie video) {
  video.read();
}

void draw() {
  imageMode(CORNER);
  image(video, 0, 0);
  animarDVD();
}
void animarDVD() {//Crear una función propia
  imageMode(CENTER);
  if (posX >= width - imagenDVD.width/2) {//Rebote esq. Der
    velocidadX = velocidadX *-1;
  } else if (posX <= imagenDVD.width/2) {//Rebote esq. Izq
    velocidadX = velocidadX *-1;
  } else if (posY >= height - imagenDVD.height/2) {//Rebote esq. Inf
    velocidadY = velocidadY *-1;
  } else if (posY <= imagenDVD.height/2) {//Rebote esq. Sup
    velocidadY = velocidadY *-1;
  }
  posX = posX + velocidadX;
  posY = posY + velocidadY;
  image(imagenDVD, posX, posY);
}
