//Función que nos permite definir la conf. inicial del sketch
//Solo se ejecuta una vez
int tamano = 1;

void setup() {
  size(800, 800);//Ancho y alto
  colorMode(HSB, 360, 100, 100);
}
//Intentar dibujar su contenido 60 veces por segundo | FrameRate
void draw() {
  int pX1 = int(random(width));
  int pY1 = int(random(height));

  int pX2 = int(random(width));
  int pY2 = int(random(height));
  //Cada segundo va incrementar el ancho de los palillos
  if (frameCount%60 == 0) {
    tamano++;//Aumenta el tamaño en 1
  }
  strokeWeight(tamano);
  stroke(int(random(360)), 80, 85);
  line(pX1, pY1, pX2, pY2);
}
