/*
Ejercicio 2 |Composición Aleatoria
 */
int posX = 0;//Definimos 2 variables para la posX, posY con valor inicial en 0
int posY = 0;
void setup() { //Esta estructura me permite definir la configuración inicial del sketch
  fullScreen();
  //size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  println("el valor en la posX es:", posX);
  println("el valor en la posY es:", posY);
}

void draw() {//Por defecto se intentará dibujar 60 veces por segundo
  //background(0);
  posX = int(random(0, width));
  posY = int(random(0, height));
  noStroke();
  int matiz = int(random(0, 360));
  fill(matiz, 80, 80);
  ellipse(posX, posY, frameCount%50, frameCount%50);
  //Si... se cumple o es verdadero lo que evaluamos dentro de los parentesis. Entonces...
  //Se ejecuta lo que esta dentro de los corchetes
  if (key == 's') {
    saveFrame("miCaptura.jpg");
    noLoop();
  }
}
