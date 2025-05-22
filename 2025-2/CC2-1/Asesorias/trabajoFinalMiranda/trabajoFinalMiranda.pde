int numFramespato = 3;//Definimos el número de frames
PImage [] pato = new PImage [numFramespato];

int numFramespatoHuella = 3;//Definimos el número de frames
PImage [] huellas = new PImage [numFramespatoHuella];

int posX, posY;
int pixelDesplazamiento = 5;//pixeles que se desplaza el patoz
void setup() {
  size(600, 600);
  imageMode(CENTER);
  for (int i = 0; i <numFramespato; i++) {//nombre de imagenes pato1.png...
    pato[i] = loadImage("pato"+ (i + 1) + ".png");
  }
  /*
   for (int i = 0; i <numFramespatoHuella; i++) {//nombre de imagenes pato1.png...
   pato[i] = loadImage("huella"+ (i + 1) + ".png");
   }
   */

  for (int i = 0; i <numFramespato; i++) {
    pato[i].resize(pato[i].width/6, pato[i].height/6);
  }
  frameRate(30);

  posX = width/2;
  posY= height/2;
}

void draw() {

  if (frameCount%5 == 0) {

    background(170);
    image (pato[frameCount%numFramespato], posX, posY);
  }

  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      posX = posX - pixelDesplazamiento;
      println("izquierda");
    } else if (keyCode == RIGHT) {
      posX = posX + pixelDesplazamiento;
      println("derecha");
    } else if (keyCode == UP) {
      posY = posY - pixelDesplazamiento;
      println("arriba");
    } else if (keyCode == DOWN) {
      posY = posY + pixelDesplazamiento;
      println("abajo");
    }
  }
}
