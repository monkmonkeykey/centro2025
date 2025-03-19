float largo = 50;
float x = 200;
float y = 200;
float inicio;
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw() {
  largo = random(5, 25);
  inicio = random(largo, width-largo);
  float colorActual = random(360);//Variable local
  float anchoLinea = random(1, 10);
  strokeWeight(anchoLinea);
  stroke(colorActual, 90, 90);
  dibujarX(inicio, largo);
}

/*Sobrecarga en función. Tener una función con el mismo nombre pero,
 que puede recibir distino número de argumetos.
 */
void dibujarX(float inicio, float largo) {
  line(inicio, inicio, inicio+largo, inicio+largo);
  line(inicio, inicio+largo, inicio+largo, inicio);
}

void dibujarX() {//conjugación de verbo en infinitivo | ar, er, ir
  //el punto en x, y donde comienza y otros 2 argumentos donde finaliza
  line(x, y, x+largo, y+largo);
  line(x, y+largo, x+largo, y);
}
