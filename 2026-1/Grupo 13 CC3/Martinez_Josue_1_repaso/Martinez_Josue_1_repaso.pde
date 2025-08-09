PImage imagen; //Definimos varible para usar imagen
int diametro = 5; //numeros enteros

void setup() {
  size(1280, 720);
  imagen = loadImage("3.jpg");//Espera el nombre especifico de la imagen a cargar
  frameRate(100000);
  noStroke();
}
//Nos permite dibujar el contenido en ella aprox 60 veces por segundo
void draw() {
  //image(imagen, 0, 0);//Dibuja la imagen en las coordenadas que te indico
  int posX = int(random(width)); //obtenemos una posición aleatoria en X
  int posY = int(random(height)); //obtenemos una posición aleatoria en Y}
  color c = imagen.get(posX, posY);
  fill(c);
  ellipse(posX, posY, diametro, diametro);
}
