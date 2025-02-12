//Es la parte donde definimos configuración inicial
void setup() {
  size(500, 700); //canvas de 500,700 px
}
//El contenido en la función se dibuja 60 veces por segundo
void draw() {
  //RGB | 0-255
  background(50);
  //Torso
  noStroke();
  fill(53, 111, 230); //tres argumentos
  /*A las funciones que pueden recibir más de 1 forma distinta
   de argumentos, se le conoce como, funciones de sobrecarga.
   */
  rect(135, 170, 250, 430);
  //1: posX, 2: posY, 3: ancho, 4: alto

  //Cabeza
  ellipse(260, 175, 250, 250);
  //Sonrisa
  strokeWeight(3);
  stroke(0);
  ellipse(220, 180, 80, 80);
  stroke(53, 111, 230);
  ellipse(239, 155, 120, 120);
  //Ojos
  fill(255);
  ellipse(230, 135, 90, 90);
  ellipse(315, 135, 75, 75);
  //Pupilas
  fill(0);
  noStroke();
  ellipse(230, 135, 15, 15);
  ellipse(315, 135, 15, 15);
}
