import processing.video.*;

Movie movie;

PImage imagenDVD;
int posX, posY;
int velX = 2;
int velY = 2;
int colorActual = 153;
boolean finReproduccion = true;

void setup() {
  size(640, 360);
  movie = new Movie(this, "video.mp4");
  movie.play();
  imagenDVD = loadImage("dvd_white.png");
  imagenDVD.resize(imagenDVD.width/6, imagenDVD.height/6);
  posX = width/2;
  posY = height/2;
  //println(posX);
  colorMode(HSB, 360, 100, 100);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  finReproduccion = movie.isPlaying();
  if (finReproduccion == true) {
    imageMode(CORNER);//Permite dibujar a partir de su centro
    image(movie, 0, 0);
  } else {
    animacionDVD();
  }
  //
}


void animacionDVD() {
  imageMode(CENTER);//Permite dibujar a partir de su centro
  tint(colorActual, 80, 80);
  image(imagenDVD, posX, posY);
  posX = posX + velX;
  posY = posY + velY;
  if (posX >= width-imagenDVD.width/2 || posX <= imagenDVD.width/2) {
    velX = velX *-1;
    colorActual = int(random(360));
  } else if (posY >= height-imagenDVD.height/2 || posY <= imagenDVD.height/2) {
    velY = velY *-1;
    colorActual = int(random(360));
  }
}
