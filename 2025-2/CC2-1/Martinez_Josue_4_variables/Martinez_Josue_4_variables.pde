//variable de tipo entero con nombre diametro y valor 50
int diametro = 50;
float posicionX;//Inicializar una variable
float posicionY; //posición
int colorActual;
void setup() {//Se ejecuta una sola vez
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  //posicionX = 500/2 = 250;
  posicionX = width/2;
  posicionY = height/2;
  noStroke(); //no contornos
}

void draw() {//Se ejecuta o dibuja 60 veces por segundo
  colorActual = int(random(195, 250));
  posicionX = random(width); //nos permite obtener valores aleatorios
  posicionY = random(height);
  fill(colorActual, 85, 90);
  ellipse(posicionX, posicionY, diametro, diametro);
}
