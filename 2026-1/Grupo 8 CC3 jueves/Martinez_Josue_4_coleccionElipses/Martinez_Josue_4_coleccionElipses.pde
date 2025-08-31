Elipse e1;//Definimos nuestro objeto
Elipse [] elipses = new Elipse[3000]; //Array, Arreglo o Colección
color [] coleccionColores = {#6491B7, #E8371C, #4B50A5, #EAC739};
int posX, posY;
int diametro;
int intensidadVibracion;
void setup() {
  fullScreen();
  background(0);
  //size(800, 800);
  //Generar repeticiones de forma controlada
  for (int i = 0; i < elipses.length; i++) {
    diametro = int(random(5, 15));
    posX = int(random(diametro, width-diametro));
    posY = int(random(diametro, height-diametro));
    intensidadVibracion = int(random(1, 10));
    elipses[i] = new Elipse(posX, posY, diametro, intensidadVibracion, coleccionColores[i%4]);
  }
  e1 = new Elipse();//Creamos a un nuevo Elipse
}

void draw() {
  noStroke();
  for (int i = 0; i < elipses.length; i++) {
    elipses[i].dibujar();
    elipses[i].vibrar();
  }
}
//Hacer por separado las funciones
// Verbo en tiempo infinitivo | ar, er, ir
