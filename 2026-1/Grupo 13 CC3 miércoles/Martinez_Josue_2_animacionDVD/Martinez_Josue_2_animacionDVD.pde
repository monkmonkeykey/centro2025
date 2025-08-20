PImage imagenDVD;
int posX, posY;
int velX = 2;
int velY = 2;
void setup() {
  size(640, 360);
  imagenDVD = loadImage("dvd_white.png");
  imageMode(CENTER);//Permite dibujar a partir de su centro
  imagenDVD.resize(imagenDVD.width/6, imagenDVD.height/6);
  posX = width/2;
  posY = height/2;
}

void draw() {
  background(0);
  image(imagenDVD, posX, posY);
  posX = posX + velX;
  //posY = posY + velY;
  if (posX >= width-imagenDVD.width/2 || posX <= imagenDVD.width/2) {
    velX = velX *-1;
  }
}
