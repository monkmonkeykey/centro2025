PImage back, bird; //Definimos variables para nuestras imagenes
float posX, posY;//Inicializamos nuestras posiciones
float off; //El contador con el cual modificará su posición
void setup() {
  size(900, 504);//Dimensiones de la imagen back
  back = loadImage("back.png");
  bird = loadImage("bird.png");
  posX = 0;
  posY = height/2;
  bird.resize(bird.width/3, bird.height/3);//Redimensionamos al pajaro
}
void draw() {
  //Siempre debe coincidir la dimension de la imagen y el size
  imageMode(CORNER);
  image(back, 0, 0);
  posX = frameCount%width;
  off = off + 0.1;
  posY = noise(off) * height;
  imageMode(CENTER);
  image(bird, posX, posY);
}
