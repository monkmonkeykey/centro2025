PImage fondo;
int posX, posY;
color colorObtenido;
int diametro = 5;
char []caracteres = {'A','l','e','x','a'};
void setup() {
  size(648, 943);
  fondo = loadImage("2.jpeg");
  noStroke();
  frameRate(500);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}
void draw() {

  posX = int(random(width));
  posY = int(random(height));
  colorObtenido = fondo.get(posX, posY);
  fill(colorObtenido);
  caracterActual = 
  text(caracterActual, posX, posY);
}
