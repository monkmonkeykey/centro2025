PImage imagen; //Inicializar la varible
int posX, posY;
int diametro = 75;
color colorPuntero; //Aquí guardaremos el color de la posición del cursor
color[] colores = new color[4];
String []codHexColores = {"", "", "", ""};
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
  textoHexadecimal(0, width/10+ width/4, imagen.height + 50);
  fill(colores[2]);
  rect(width/4*2, imagen.height, width/4, 100);

  fill(colores[3]);
  rect(width/4*3, imagen.height, width/4, 100);
}
//Eventos | Escucha si el botón del mouse ha dejado de ser presionado
void mouseReleased() {
  colores[indice%4] = colorPuntero;
  codHexColores[indice%4]= "#" + hex( colorPuntero);
  indice++; //indice aumente su valor en 1
}

void textoHexadecimal(int indice, int x, int y) {
  fill(0);
  text(codHexColores[indice], x, y);
}
