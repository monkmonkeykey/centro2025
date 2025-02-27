//Creamos un array del objeto Elipse, definiendo su tamaño dentro de las llaves
Elipse [] elipses = new Elipse [5000];
float posX, posY, diametro;
int margen = 25;
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < elipses.length; i++) {
    posX = random(margen, width-margen);
    posY = random(margen, height-margen);
    diametro = random(5, 25);
    elipses[i] = new Elipse(posX, posY, diametro); //Definimos las características de la elipseUno
  }
}

void draw() {
  background(50);
  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
  }
}
