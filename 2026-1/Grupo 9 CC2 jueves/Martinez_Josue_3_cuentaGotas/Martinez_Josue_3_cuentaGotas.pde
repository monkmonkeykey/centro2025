PImage imagen;
color [] coleccionColores = new color[4]; //Array | Arreglos = Colección
int indice;//Inicializamos y tiene un valor 0
color colorActual;
void setup() {
  size(1280, 800);
  imagen = loadImage("0.jpg");
}

void draw() {
  noCursor();
  noStroke();
  int posX = mouseX;
  int posY = mouseY;
  colorActual = imagen.get(posX, posY);
  image(imagen, 0, 0);
  fill(colorActual);
  ellipse(posX, posY, 50, 50);
  //Primer color sampleado
  fill(coleccionColores[0]);
  rect(0, 720, width/4, 80);
  fill(0);
  text(hex(coleccionColores[0]), width/9, 760);
  //Segundo color sampleado
  fill(coleccionColores[1]);
  rect(width/4, 720, width/4, 80);
  fill(0);
  text(hex(coleccionColores[1]), width/9+width/4, 760);
  //Tercer color sampleado
  fill(coleccionColores[2]);
  rect(width/4*2, 720, width/4, 80);
  fill(0);
  text(hex(coleccionColores[2]), width/9+width/4*2, 760);
  //Cuarto color sampleado
  fill(coleccionColores[3]);
  rect(width/4*3, 720, width/4, 80);
  fill(0);
  text(hex(coleccionColores[3]), width/9+width/4*3, 760);
}
void mousePressed() {
  coleccionColores[indice%coleccionColores.length] = colorActual;
  indice++;
}
//Escucha si se presiona una tecla
void keyPressed() {
  if (key == 's') {//Si se presiona la "s" guarda el frame actual
    saveFrame("miPaletaDeColores.jpg");
    println("Mi imagen se guardo correctamente!");
  }
}
