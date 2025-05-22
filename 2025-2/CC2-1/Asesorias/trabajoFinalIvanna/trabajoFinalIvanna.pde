int numFramesRetratos = 3;//Definimos el número de frames
PImage [] Retratos = new PImage [numFramesRetratos];


int posX, posY;
int espacio = 5;//pixeles que se desplaza el Retratosz
int tamañoPixel = 5;
color colorActual; //Permite este dato guardar un color
int imagenActual;
int numeroAleatorio;
void setup() {
  size(600, 600);
  //imageMode(CENTER);
  for (int i = 0; i <numFramesRetratos; i++) {//nombre de imagenes Retratos1.png...
    Retratos[i] = loadImage("retrato"+ (i + 1) + ".jpg");
  }


  for (int i = 0; i <numFramesRetratos; i++) {
    Retratos[i].resize(Retratos[i].width/1, Retratos[i].height/1);
  }
  frameRate(140);

  posX = width/2;
  posY= height/2;

  background(170);
  imagenActual = int(random(0, numFramesRetratos));

  //image (Retratos[imagenActual], posX, posY);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  pixelear();
}


void pixelear() {
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
  colorActual =Retratos[imagenActual].get(posX, posY);
  fill(colorActual);
  rect(posX, posY, tamañoPixel, tamañoPixel);

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
