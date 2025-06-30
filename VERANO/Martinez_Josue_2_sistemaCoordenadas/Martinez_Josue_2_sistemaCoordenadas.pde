void setup() { //Comentarios. Definimos nuestro setup. solo se ejecuta una vez
  size(500, 500);
  colorMode(HSB, 360, 100, 100);//Definimos el modo de color
  frameRate(60);//FPS
  noCursor();//No lo hagas. No dibujes el cursor
}
//draw(). Me permite dibujar el contenido por defecto 60 veces por segundo
void draw() {
  //Módulo %
  fill(random(178, 247), 80, 100);
  ellipse(mouseX, mouseY, frameCount%50, frameCount%50);
  
}
