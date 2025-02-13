PImage fondo; //Que nos permite usar y guardar en la memoria imagenes
color colorActual; //Variable para usar valores de color
int diametro = 5;
int posX, posY;
//Array | Arreglo | Colleción
char [] letras = {'j', 'o', 's', 'u', 'e'};
void setup() {
  size(1280, 720);
  fondo = loadImage("3.jpg");
  noStroke();
  rectMode(CENTER);
  frameRate(1000);
  textSize(15);
  fondo.resize(width,height);
}

void draw() {
  posX = int(random(width));
  posY = int(random(height));
  //get | nos permite obtener el color de un pixel específico
  colorActual = fondo.get(posX, posY);
  puntillismoLetras();
}

void puntillismoCirculo() {
  fill(colorActual);
  ellipse(posX, posY, diametro, diametro);
}

void puntillismoLetras() {
  fill(colorActual);
  int indiceActual = int(random(letras.length));
  text(letras[indiceActual], posX, posY);
}


void puntillismoCuadrado() {
  fill(colorActual);
  rect(posX, posY, diametro, diametro);
}

void keyPressed() {
  if (key == 'c') {
    puntillismoCirculo();
  } else if (key == 'r') {
    puntillismoCuadrado();
  }
}
