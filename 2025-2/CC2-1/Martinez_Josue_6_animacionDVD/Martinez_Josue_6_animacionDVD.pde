import processing.video.*;
Movie video; //Creamos un objeto video
PImage imagenDVD;
float posX, posY;
float velocidadX = 1.5;
float velocidadY = 1.5;
int colorActual;
boolean reproduccion = false; //Definir un estado de reproducción

void setup() {
  size(640, 360);
  colorMode(HSB, 360, 100, 100);
  imagenDVD = loadImage("dvd_white.png");
  video = new Movie(this, "video.mp4");
  posX = width/2;
  posY = height/2;
  imagenDVD.resize(imagenDVD.width/8, imagenDVD.height/8);
  video.play(); //Processing reproduce el video
}

void movieEvent (Movie video) {
  video.read();
}

void draw() {
  background(0);
  reproduccion = video.isPlaying(); //Obtener el estado de reproducción del vídeo y lo guardamos
  if (reproduccion) {
    reproducirVideo();
  } else if (reproduccion == false) { //Entra la animación del DVD
    animarDVD();
  }
}




void reproducirVideo() {
  imageMode(CORNER);
  image(video, 0, 0);
}

void animarDVD() {
  imageMode(CENTER); //Dibujamos le imagen desde su coordenada en el centro
  tint(colorActual, 90, 90);//Entintamos nuestra imagen
  image(imagenDVD, posX, posY);
  /*si la posX es mayor o igual que el ancho O posX es menor o
   igual que cero, entonces invierte la dirección.
   */
  // || OR Ejemplo: Si tengo hambre o tengo tiempo de comer, entonces... Como
  // && AND
  if (posX >= width - imagenDVD.width/2 || posX <= imagenDVD.width/2) {
    velocidadX = velocidadX  *-1;
    colorActual = int(random(360));
  } else if (posY >= height - imagenDVD.height/2 || posY <= imagenDVD.height/2) {
    velocidadY = velocidadY  *-1;
    colorActual = int(random(360));
  }
  posX = posX + velocidadX;
  posY = posY + velocidadY;
}
