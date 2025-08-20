PImage imagen;  //es el tipo de dato con el cual usamos img
//La sección donde configuramos nuestro sketch
void setup() {
  size(1280, 720);
  imagen = loadImage("3.jpg");
}
//Intenta dibujar 60 veces por segundo su contenido
void draw() {
  //image(imagen, 0, 0);
  dibujaPuntillismo();
}
void dibujaPuntillismo() {
  int posX = int(random(width));
  int posY = int(random(height));
  color c = imagen.get(posX, posY);
  fill(c);
  noStroke();
  ellipse(posX, posY, 5, 5);
}s
