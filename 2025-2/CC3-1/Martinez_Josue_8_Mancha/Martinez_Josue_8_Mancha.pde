Mancha [] manchitas = new Mancha [1000];
float x, y, diametro, velocidad;
int direccion = 1;
PImage imagen;
color colorObtenido;

void setup() {
  size(1200, 738); //Nuevas dimensiones
  imagen = loadImage("1.jpg");
  for (int i = 0; i < manchitas.length; i++) {
    diametro = random(5, 15);
    x = random(diametro/2, width-diametro/2);
    y = random(diametro/2, height-diametro/2);
    velocidad = random(-2, 2);
    manchitas[i] = new Mancha (x, y, diametro, velocidad, imagen, colorObtenido);
  }
  noStroke();
}

void draw() {
  fill(0, 15); // escalaGrises, transparencia o canalAlpha
  rect(0, 0, width, height);
  for (int i = 0; i < manchitas.length; i++) {
    manchitas[i].mover();
    manchitas[i].dibujar();
  }
}
