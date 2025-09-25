int offset; //Tendrá un valor de 0 
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
}
void draw() {
  //width = 800, por lo tanto esto se repite 800 veces
  for (int i = 0; i < width; i++) {
    //Mapeamos el valor de i para interpretarlo como Hue
    float colorActual = map(i + offset, 0, width, 0, 360);
    stroke(colorActual%360, 80, 80);
    line(i, 0, i, height);
  }
  //offset = offset + 2;
  offset += 5;
}
