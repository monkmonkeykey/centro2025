PImage imagen;  //es el tipo de dato con el cual usamos img
//La sección donde configuramos nuestro sketch
void setup() {
  size(1280, 720);
  imagen = loadImage("3.jpg");
}
//Intenta dibujar 60 veces por segundo su contenido
void draw() {
  image(imagen, 0, 0);
  int posX = int(random(width));
  int posY = int(random(height));
  
  ellipse(posX, posY, 50, 50);
}
