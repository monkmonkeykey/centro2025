PImage fondo;
boolean hambre = true;//Guarda un estado de verdad. El cual puede ser false o true
int posX, posY;
float diametro = 7;
int espacio = 9;
color colorActual; //Permite este dato guardar un color
int numeroAleatorio;

void setup() {
  //fullScreen();
  size(1280, 720); //1920,1080
  colorMode(HSB, 360, 100, 100);//Definimos el modo de color en HSB
  fondo = loadImage("0.jpg"); //Cargar mi imagen
  posX = width/2;
  posY = height/2;
  //image(fondo, 0, 0);
  noStroke();
}

void draw() {
  // == | Igual qué
  //Si... hambre es igual a verdadero, entonces ejecuta el código
  numeroAleatorio = int(random(4));//obtener de forma aleatorio valores en 0-4
  if (numeroAleatorio == 0) {//Si el valor es verdadero entonces, colorea de rojo

    posX = posX + espacio;
  } else if (numeroAleatorio == 1) {//Si el valor es verdadero entonces, colorea de rojo

    posX = posX - espacio;
  } else if (numeroAleatorio == 2) {//Si el valor es verdadero entonces, colorea de rojo

    posY = posY - espacio;
  } else if (numeroAleatorio == 3) {//Si el valor es verdadero entonces, colorea de rojo

    posY = posY + espacio;
  }
  colorActual = fondo.get(posX, posY);
  fill(colorActual);
  ellipse(posX, posY, diametro, diametro);

  //Condición que permite colisiones en los bordes.
  if (posX >= width) {
    posX = posX * -1; //Invierte la posición
  } else if (posX <= 0) {
    posX = posX * -1; //Invierte la posición
  } else if (posY >= height) {
    posY = posY * -1; //Invierte la posición
  } else if (posY <= 0) {
    posY = posY * -1; //Invierte la posición
  }
}
