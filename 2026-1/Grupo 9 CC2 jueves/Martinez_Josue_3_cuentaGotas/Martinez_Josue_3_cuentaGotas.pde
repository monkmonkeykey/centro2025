PImage imagen;

void setup() {
  size(1280, 720);
  imagen = loadImage("0.jpg");
}

void draw() {
  int posX = mouseX;
  int posY = mouseY;
  color colorActual = imagen.get(posX, posY);
  image(imagen, 0, 0);
  fill(colorActual);
  ellipse(posX, posY, 50, 50);
}
