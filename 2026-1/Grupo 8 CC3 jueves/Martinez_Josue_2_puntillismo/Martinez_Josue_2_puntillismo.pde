//Reserva un espacio en la memoria para trabajar con una imagen
PImage imagen;

void  setup() {
  size(1280, 720);
  imagen = loadImage("3.jpg");
}
void draw() {
  int gradosRot = int(random(360));
  puntillismoLetra('a', gradosRot);
}

void puntillismoLetra(char caracter, int gradosRot) {
  //image(imagen, 0, 0);
  int posX = int(random(width));
  int posY = int(random(height));
  color c = imagen.get(posX, posY);
  fill(c);
  pushMatrix();
  rotate(radians(gradosRot));
  text(caracter, posX, posY);
  popMatrix();
}

void puntillismoPunto() {
  //image(imagen, 0, 0);
  int posX = int(random(width));
  int posY = int(random(height));
  color c = imagen.get(posX, posY);
  strokeWeight(5);
  stroke(c);
  point(posX, posY);
}
