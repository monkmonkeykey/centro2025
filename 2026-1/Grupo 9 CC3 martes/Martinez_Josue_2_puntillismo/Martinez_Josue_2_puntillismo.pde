PImage imagen; //Usamos un tipo de dato para imagen
int diametro = 5;
void setup() {
  size(1280, 720);
  imagen = loadImage("0.jpg");
  noStroke();
  //frameRate(10000000);
}
void draw() {
  //puntillismoPunto();
  puntillismoLetra("hola");
}
void puntillismoLetra(String texto) {
  for (int i = 0; i <60; i++) {
    int posX  = int(random(width));
    int posY = int(random(height));
    color colorActual = imagen.get(posX, posY);
    fill(colorActual);
    int valorActual = int(random(1, texto.length()));
    text(texto.charAt(valorActual), posX, posY);
  }
}



void puntillismoPunto() {
  for (int i = 0; i <60; i++) {
    int posX  = int(random(width));
    int posY = int(random(height));
    color colorActual = imagen.get(posX, posY);
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
}
