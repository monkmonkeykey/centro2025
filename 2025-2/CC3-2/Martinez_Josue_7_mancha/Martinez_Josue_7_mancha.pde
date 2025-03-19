Mancha [] manchitas = new Mancha [500];
float x, y, diametro, velocidad;
PImage imagen;
void setup() {
  size(1280, 720);
  imagen = loadImage("3.jpg");
  for (int i = 0; i < manchitas.length; i++) {
    diametro = random(5, 15);
    x = random(diametro/2, width-diametro/2);
    y = random(diametro/2, height-diametro/2);
    velocidad = random(-2, 2);
    manchitas[i] = new Mancha (x, y, diametro, velocidad, imagen);
  }
}
void draw() {
  colorMode(RGB);
  fill(0, 15);

  rect(0, 0, width, height);
  for (int i = 0; i < manchitas.length; i++) {
    manchitas[i].mover();
    manchitas[i].dibujar();
  }
}
