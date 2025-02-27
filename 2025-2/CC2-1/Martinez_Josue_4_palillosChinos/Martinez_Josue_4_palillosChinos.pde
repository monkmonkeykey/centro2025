float posXIni, posYIni, posXFin, posYFin;//Definiendo las variables de posición
int colorActual;
int margen = 10; //definir un espacio entre las esquinas
int anchoLinea = 1;
void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  /*Dibuja una linea recta a partir de donde nace un punto
   y donde termina otro */
  posXIni = random(margen, width-margen);
  posYIni = random(margen, height-margen);
  posXFin = random(margen, width-margen);
  posYFin = random(margen, height-margen);
  colorActual = int (random(0, 360));
  strokeWeight(anchoLinea);
  stroke(colorActual, 90, 90);
  line(posXIni, posYIni, posXFin, posYFin);
  //Regla
  //Cada 2 segundos incremente el ancho de línea en 1
  if (frameCount%120 == 0) {
    //
    anchoLinea = anchoLinea + 1;
  }
}
