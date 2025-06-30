float diametro = 25.5; //Esta variable de contexto global
int posX = 25;
int posY = 25;
int colorFondo; //Definir una variable. Se le asigna un valor de 0 por defecto
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);

  background(colorFondo, 80, 100);
}

void draw() {//Se dibuja 60 veces por segundo
  background(colorFondo, 80, 100);
  colorFondo = colorFondo + 1;
  diametro = diametro - 0.025;
  ellipse(posX%500, 250, diametro, diametro);
  posX = posX + 1;
  posY = posY + 1;
  println(posX);
}
