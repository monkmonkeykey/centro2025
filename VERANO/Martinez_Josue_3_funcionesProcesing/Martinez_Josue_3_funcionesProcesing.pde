/*
Esto es un código que realizamos el 20/06/25
 Este código presenta el uso de funciones nativas de processing.
 Esto incluye características de color y formas 2D.
 Josué Martínez | Código Creativo Curso Verano
 */

void setup() {
  size(500, 500);
  frameRate(300);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  noCursor();
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  //background(0);
  //Funciones de sobrecarga
  //fill(255, 255, 255); //Recibe 3 argumentos
  stroke(245, 188, 32);
  line(mouseX, mouseY, random(0, width), random(0, height));
  /*
  fill(200);//Recibe 1 argumento
   strokeWeight(frameCount%25);
   stroke(0, 0, 255);
   rect(frameCount%width, 250, 50, 50);
   //Primera elipse
   fill(127);//Recibe 1 argumento
   strokeWeight(frameCount%20);
   stroke(255, 0, 0);
   ellipse(mouseX, mouseY, 50, 50);
   //Segunda elipse
   noFill();
   strokeWeight(frameCount%20);
   stroke(255, 0, 0);
   ellipse(frameCount%width, 125, 50, 50);
   */
}
