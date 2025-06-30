PImage fondo;
int posX, posY;
color colorObtenido;
int diametro = 5;
void setup() {
  size(1280, 720);
  fondo = loadImage("3.jpg");
  noStroke();
  frameRate(500);
  rectMode(CENTER);
}
void draw() {
  posX = int(random(width));
  posY = int(random(height));
  colorObtenido = fondo.get(posX, posY);
  fill(colorObtenido);
  ellipse(posX, posY, diametro, diametro);
  rect(posX, posY, diametro, diametro);
}
