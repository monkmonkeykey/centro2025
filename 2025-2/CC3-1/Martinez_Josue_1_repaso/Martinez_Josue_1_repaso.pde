//Definir la posición inicial de todos los puntos
int posXIni, posYIni, posXFin, posYFin;//Automaticamente tienen el valor de 0
//Configuración inicial de sketch | Se ejecuta una sola vez
int margen = 10;//Valor de margen
int colorActual; //Variable para colorActual
int anchoLinea = 1;
void setup() {
  fullScreen();
  //size(500, 500);
  colorMode(HSB, 360, 100, 100);//Defino el modo de color HSB
}
//Función me permite dibujar 60 veces por segundo su contenido.
void draw() {
  posXIni = int(random(margen, width-margen));
  posYIni = int(random(margen, height-margen));
  posXFin = int(random(margen, width-margen));
  posYFin = int(random(margen, height-margen));
  colorActual = int (random(0, 360));
  stroke(colorActual, 80, 90);
  strokeWeight(anchoLinea);//Definir el ancho de línea de las formas
  line(posXIni, posYIni, posXFin, posYFin);

  //Si frameCount %120 es igual 0, entonces... aumenta anchoLinea en uno
  if (frameCount % 120 == 0) {
    anchoLinea++;//Incrementa su valor en 1
  }
}
//Si se presiona una tecla, ejecuta el contenido de la función
void keyPressed() {
  if (key == 's') { //Si se presiona la tecla s, se guarda el frame
    saveFrame("Martinez_Josue_1_repaso.png");
  } else if (key == 'e') {//Si se presiona la tecla e, se limpia la pantalla
    background(0, 0, 40);
  }
}
