int value = 0;
int colorActual;
PImage fondo;//dato que nos permite trabajar con imagen
PImage bird;
int posX, posY;
int desplazamientoX = 2;
int desplazamientoY = 2;
void setup() {
  size(900, 504);
  colorMode(HSB, 360, 100, 100);
  fondo = loadImage("back.png");//Cargamos la imagen de fondo
  bird = loadImage("bird.png");
  posX = width/2;
  posY = height/2;
}

void draw() {
  imageMode(CORNER);
  image(fondo, 0, 0);
  imageMode(CENTER);
  image(bird, posX, posY, bird.width/4, bird.height/4);
  //si...
  /*
  if (mousePressed == true) {
   fill(0);//negro
   } else {
   fill(255);//blanco
   }*/
  //fill(colorActual, 80, 100);
  //rect(25, 25, 50, 50);
}

void mousePressed() {
  if (value == 0) {
    value = 50;
  } else {
    value = 25;
  }
}
//Escuchar si se esta presionando una tecla
void keyPressed() {
  if (key == 'w') {//entonces... ejecuta lo siguiente
    posY = posY - desplazamientoY;
  } else if (key == 's') {
    posY = posY + desplazamientoY;
  } else if (key == 'a') {
    posX = posX - desplazamientoX;
  } else if (key == 'd') {
    posX = posX + desplazamientoX;
  }
}
