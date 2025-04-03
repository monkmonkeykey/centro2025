PImage fondo, bird; //Definimos tipos de dato para las imagenes que usaremos
float posX, posY; //Definimos datos para posición
float factorNoise = 0.002; // Define la velocidad de movimiento
float offSet; // Contador o la semilla del noise
void setup() {
  size(900, 504);
  fondo = loadImage("back.png");
  bird = loadImage("bird.png");
  imageMode(CENTER); //Define como se dibuja la imagen
  posX = width/2;
  posY = height/2;
  bird.resize(bird.width/4, bird.height/4);
}

void draw() {
  background(fondo);
  offSet = offSet + factorNoise; //Contador
  posY = noise(offSet) * height;
  posX = frameCount% width + bird.width/2;
  posX = map(posX, 0, width + bird.width/2, -bird.width, width + bird.width/2);
  image(bird, posX, posY);
}
