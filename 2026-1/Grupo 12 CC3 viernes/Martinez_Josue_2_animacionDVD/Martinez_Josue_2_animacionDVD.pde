import processing.video.*;
Movie movie;
PImage imagenDVD; //Inicializar una variable
int posX, posY;
int velX = 2;
int velY = 2;
void setup() {
  size(640, 360);
  imagenDVD = loadImage("dvd_white.png");
  imagenDVD.resize(imagenDVD.width/5, imagenDVD.height/5);
  movie = new Movie(this, "video.mp4");
  movie.play();

  posX = width/2;
  posY = height/2;
}
void movieEvent(Movie m) {
  m.read();
}
void draw() {
  if (movie.available() == true) {
    movie.read();
  }
  background(0);
  imageMode(CORNER);
  image(movie, 0, 0);
  //animacionDVD();
}
void animacionDVD() {
  imageMode(CENTER);
  image(imagenDVD, posX, posY);
  posX = posX + velX;
  posY = posY + velY;
  if (posX >= width - imagenDVD.width/2 || posX<= imagenDVD.width/2) {
    velX = velX *-1;
  } else if (posY >= height - imagenDVD.height/2 || posY<= imagenDVD.height/2) {
    velY = velY *-1;
  }
}
