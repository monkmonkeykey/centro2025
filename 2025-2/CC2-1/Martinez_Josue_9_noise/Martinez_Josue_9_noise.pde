PImage fondo, bird; //Variables para imagen
float posX, posY;  //Variables para posición
float factorNoise = 0.01; //La intensidad de movimiento
float offSet; // Iniciandolo 0 
void setup() {
  size(900, 504);//Dimensiones a partir de la imagen de fondo
  fondo = loadImage("back.png");
  bird = loadImage("bird.png");
  imageMode(CENTER);
  posX = width/2;
  posY = height/2;
  bird.resize(bird.width/4, bird.height/4);
}

void draw() {
  background(fondo);
  offSet = offSet + factorNoise;
  posY = noise(offSet) * height;//El último valor por el que se multiplca es el rango
  posX = (frameCount) %width+bird.width/2;

  image(bird, posX, posY);
}
