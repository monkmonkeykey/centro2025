/*
Ejercicio 1 | hola Mundo
 Ejercicio de aproximación con Processing
 Este código esta basado en el código de Fernandito que o
 */

void setup() { //Esta estructura me permite definir la configuración inicial del sketch
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
}

void draw() {//Por defecto se intentará dibujar 60 veces por segundo
  //background(0);
  noStroke();
  fill(0, 1);
  rect(0, 0, width, height);
  strokeWeight(frameCount%10);
  stroke(0, 80, 80);//El color para el borde de la figura
  fill(random(360), 80, 80);
  ellipse(mouseX, mouseY, frameCount%100, frameCount%100);
}
