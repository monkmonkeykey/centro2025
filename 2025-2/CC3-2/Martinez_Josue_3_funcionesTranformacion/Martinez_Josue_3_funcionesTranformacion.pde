//Repaso de tipos de datos, estructura if, else if
PImage fondo;//Es un dato que nos permite trabajar con imagenes
char [] letras = {'j', 'o', 's', 'u', 'e'}; //Dato que nos permite usar carácteres
color colorActual; //Permite guardar un color en ella
int posX, posY;
int indiceLetra;
int posXIni, posYIni, posXFin, posYFin; //Definición de variables
int margen =0;
int colorActualPalillos; //Por defecto tienen un valor 0
int anchoLinea = 1;


void setup() {
  size(1280, 720);
  colorMode(HSB, 360, 100, 100);
  fondo = loadImage("0.jpg"); //Cargamos la imagen a utilizar
  frameRate(1500);
  textSize(20);
  dibujaLetras();
}
void draw() {


  if (key == 'l') {
    dibujaLetras();
  } else  if (key == 'p') {
    palillosChinos();
  }
}
//Definir una función | Definir una acción en el código
void dibujaLetras () {
  //image(fondo, 0, 0);
  pushMatrix();
  posX = int(random(0, width));
  posY = int(random(0, height));
  translate(posX, posY);//500,10
  //fondo.get, me permite obtener el color concreto de un pixel
  colorActual = fondo.get(posX, posY);
  fill(colorActual);
  indiceLetra = int(random(0, letras.length));
  rotate(radians(random(360)));
  text(letras[indiceLetra], 0, 0); // 500,10
  popMatrix();
}

void palillosChinos() {
  posXIni = int (random(margen, width-margen));//5-495
  posYIni = int (random(margen, height-margen));
  posXFin = int (random(margen, width-margen));//5-495
  posYFin = int (random(margen, height-margen));
  colorActualPalillos = int(random(360)); //Funciones de sobrecarga
  //Si, el contador de frames en unlímite de 60 es == 0, entonces...
  if (frameCount % 120 == 0) {
    anchoLinea++;
  }
  strokeWeight(anchoLinea);
  stroke(colorActualPalillos, 80, 90);
  line(posXIni, posYIni, posXFin, posYFin);
}
