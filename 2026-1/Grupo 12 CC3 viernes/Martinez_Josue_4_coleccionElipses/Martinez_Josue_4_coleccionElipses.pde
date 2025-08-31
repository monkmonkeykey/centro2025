Elipse [] elipses = new Elipse[1000];
float posX, posY;
float diametro;
float velX;
float velY;
color [] misColores = {#6491B7, #E8371C, #4B50A5, #EAC739}; //Array = Arreglo | Colección de colores
void setup() {
  fullScreen();
  frameRate(80);
  for (int i = 0; i < elipses.length; i++) {
    //Valores aleatorios para mis elipses
    diametro = random(3, 15);
    posX = random(diametro, width-diametro);
    posY = random(diametro, height-diametro);
    velX = random(2, 7);
    velY = random(2, 7);
    elipses[i] = new Elipse(posX, posY, diametro, velX, velY, misColores[i%misColores.length]);
  }
  noStroke();//No contorno o borde
}

void draw() {

  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
  }
}

// Acción concreta | Conjugar un verbo en infinitivo = Terminación ar, er, ir
