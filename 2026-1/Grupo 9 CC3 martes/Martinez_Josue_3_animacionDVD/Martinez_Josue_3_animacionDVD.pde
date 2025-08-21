import processing.video.*;
Movie movie;

PImage dvd;
int posX, posY;//Inicializamos las variables
int velX = 2;
int velY = 2;
void setup() {
  size(640, 360);
  movie = new Movie(this, "video.mp4");
  movie.play();
  dvd = loadImage("dvd_white.png");
  dvd.resize(dvd.width/6, dvd.height/6);
  posX = width/2;
  posY = height/2;
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  if (movie.available() == true) {
    movie.read();
  }
  imageMode(CORNER);
  image(movie, 0, 0);
  //animacionDVD();
}

void animacionDVD() {
  imageMode(CENTER);
  image(dvd, posX, posY);
  // || Operador lógico Or
  //Si las posX es mayor o igual al ancho - el ancho de la imagen entre 2
  //Si las posX es menor o igual el ancho de la imagen entre 2
  if (posX >= width - dvd.width/2 || posX <= dvd.width/2) {
    velX = velX *-1;
  } else if (posY>= height - dvd.height/2 || posY <= dvd.height/2) {
    velY = velY *-1;
  }
  posX = posX + velX;
  posY = posY + velY;
}
