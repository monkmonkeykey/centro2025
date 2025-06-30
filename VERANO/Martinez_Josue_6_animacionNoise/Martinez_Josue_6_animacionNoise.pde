int value = 0;
int colorActual;
PImage fondo;//dato que nos permite trabajar con imagen
PImage bird;
float posX, posY;
int desplazamientoX = 2;
int desplazamientoY = 2;
float offY = 0.0;
float velOffY = 0.005;
void setup() {
  size(900, 504);
  colorMode(HSB, 360, 100, 100);
  fondo = loadImage("back.png");//Cargamos la imagen de fondo
  bird = loadImage("bird.png");
  posX = width/2;
  posY = height/2;
}

void draw() {
  noStroke();
  imageMode(CORNER);
  //image(fondo, 0, 0);
  imageMode(CENTER);
  //image(bird, posX%width, posY, bird.width/4, bird.height/4);
  fill(0, 10);
  rect(0, 0, width, height);
  fill(130, 80, 100);
  ellipse(posX%width, posY, 20, 20);
  posX = posX + desplazamientoX;
  offY = offY + velOffY;
  posY = noise(offY) * height;
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
