import processing.sound.*;//La totalidad de ella

float posX, posY;
float diametro;
float velX;
float velY;
color [] misColores = {#DE4141, #417BDE, #E5D53C}; //Array o colección de colores
SoundFile audio; //El dato que nos permitirá usar un audio
String miTexto = "Josué";

Elipse eli1; //Llamamos a nuestro objeto Elipse y lo llamamos eli1
Elipse [] misElipses = new Elipse[10]; //Colecciones de datos | Colección de Elipses de 100 elementos
void setup() {
  size(600, 600);
  audio = new SoundFile(this, "pelota.wav"); //Cargamos a nuestro
  //fullScreen();
  eli1 = new Elipse();//Creamos a nuestro objeto Elipse llamado eli1
  for (int i = 0; i < misElipses.length; i++) {
    diametro = random(5, 25);
    posX = random(diametro, width-diametro);
    posY = random(diametro, height-diametro);
    velX = 2;
    velY = 1.5;
    misElipses[i] = new Elipse(posX, posY, diametro, velX, velY, misColores[i%misColores.length], audio, miTexto);
  }
}

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i < misElipses.length; i++) {
    misElipses[i].dibujar();
    //misElipses[i].vibrar();
    misElipses[i].desplazar();
    misElipses[i].rebotar();
    misElipses[i].escribir();
  }
}
//Definición de nombres a partir de conjugar el verbo en infinitivo | ar, er, ir
//Función que crearemos nosotros
