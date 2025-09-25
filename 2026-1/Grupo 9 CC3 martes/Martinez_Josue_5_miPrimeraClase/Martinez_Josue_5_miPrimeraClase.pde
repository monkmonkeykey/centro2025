float posX, posY;
float diametro = 20;
float velX = 5;
float velY = 5;
color colorActual = #1B6BBF;

Elipse eli1; //Llamamos a nuestro objeto Elipse y lo llamamos eli1

void setup() {
  size(600, 600);
  eli1 = new Elipse();//Creamos a nuestro objeto Elipse llamado eli1
}

void draw() {
  eli1.dibujar();
  eli1.vibrar();
}
//Definición de nombres a partir de conjugar el verbo en infinitivo | ar, er, ir
//Función que crearemos nosotros
