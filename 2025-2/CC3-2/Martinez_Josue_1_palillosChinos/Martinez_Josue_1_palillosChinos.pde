int posXIni, posYIni, posXFin, posYFin; //Definición de variables
int margen =0;
int colorActual; //Por defecto tienen un valor 0
int anchoLinea = 1;
void setup() { //Configurar de forma inicial el sketch
  //size(500, 500);
  fullScreen();
  colorMode(HSB, 360, 100, 100);
}

void draw() {//Dibujar en la pantalla el código contenido
  posXIni = int (random(margen, width-margen));//5-495
  posYIni = int (random(margen, height-margen));
  posXFin = int (random(margen, width-margen));//5-495
  posYFin = int (random(margen, height-margen));
  colorActual = int(random(360)); //Funciones de sobrecarga
  //Si, el contador de frames en unlímite de 60 es == 0, entonces...
  if (frameCount % 120 == 0) {
    anchoLinea++;
  }
  strokeWeight(anchoLinea);
  stroke(colorActual, 80, 90);
  line(posXIni, posYIni, posXFin, posYFin);
}
