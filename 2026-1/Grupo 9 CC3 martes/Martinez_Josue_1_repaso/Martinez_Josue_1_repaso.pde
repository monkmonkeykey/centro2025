//Definir las variables
float diametro = 0;
float incremento = 1;
//Configuración inicial
void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(127);
}
//Proceesing intentará dibujar esto 60 veces por segundo
void draw() {
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  stroke(frameCount%360, 80, 100);
  fill(127);
  ellipse(mouseX, mouseY, diametro, diametro);
  diametro += incremento;
  if (diametro >= 100) {
    incremento *= -1;
  } else if (diametro <= 0) {
    incremento *= -1;
  }
}
