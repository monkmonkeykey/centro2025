PImage imagen; //Inicializar la varible
int posX, posY;
int diametro = 75;
color colorPuntero; //Aquí guardaremos el color de la posición del cursor
color[] colores = new color[4]; //Array
String [] nombreColores  = {"rosa", "rojo", "", ""}; //Definimos un array para el nombre de los colres
int indice;
void setup() {
  size(960, 640);
  //size(800, 600);//Aspect Ratio 4:3
  //size(540,960); //Vertical
  // size(600, 600); //1:1
  imagen = loadImage("1.jpg");
  imagen.resize(960, 540); //Redimensionar la imagen
  noCursor();
}
void draw() {
  cuentaGotas();
}

/*Funciones son bloques de código que nos permiten hacer una acción
 concreta. Las funciones se definen y tienen que ser llamadas para que
 realicen la tarea a ejecutar.*/
void textoHexadecimal(int numIndice, int x, int y) {
  noStroke();
  fill(0, 35);
  rect(x, y, 57, -11);
  fill(255);
  text(nombreColores[numIndice], x, y);
}
void cuentaGotas() {
  image(imagen, 0, 0);
  posX = mouseX;
  posY = mouseY;
  colorPuntero = imagen.get(posX, posY);
  fill(colorPuntero);
  ellipse(posX, posY, diametro, diametro);

  fill(colores[0]);
  rect(0, imagen.height, width/4, 100);
  textoHexadecimal(0, width/10, imagen.height + 50);

  fill(colores[1]);
  rect(width/4, imagen.height, width/4, 100);
  textoHexadecimal(1, width/10 + width/4, imagen.height + 50);

  fill(colores[2]);
  rect(width/4*2, imagen.height, width/4, 100);
  textoHexadecimal(2, width/10 + width/4*2, imagen.height + 50);

  fill(colores[3]);
  rect(width/4*3, imagen.height, width/4, 100);
  textoHexadecimal(3, width/10 + width/4*3, imagen.height + 50);
}
//Eventos | Escucha si el botón del mouse ha dejado de ser presionado
void mouseReleased() {
  colores[indice%4] = colorPuntero;
  nombreColores[indice%4] = "#" + hex(colorPuntero);
  indice++; //indice aumente su valor en 1
}
void keyPressed() {
  if (key == 's') {//Si presiono la tecla 's'
    saveFrame("muestraColores.jpg");
    println("El frame ha sido guardado correctamente");
  }
}
