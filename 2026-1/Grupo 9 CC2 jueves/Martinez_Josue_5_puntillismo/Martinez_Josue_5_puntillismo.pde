PImage miImagen;//Definimos la variable para nuestra imagen
int diametro = 5;
int separacion = 7;
color colorActual;//Inicializamos la variable su valor será de
int posX, posY;
//Se ejecuta/dibuja solo una vez
void setup() {
  //size(1280, 720); // tamaño de nuestro canvas
  size(960,540);
  colorMode(HSB, 360, 100, 100);
  miImagen = loadImage("5.jpg");//El nombre de la imagen importada
  //ellipse(width/2, height/2, 50, 50);
  posX = width/2;
  posY = height/2;
  frameRate(20000);
}
//dibujar 60 veces por segundo
void draw() {
  noStroke();
  //probabilidad(); //Llamamos a la función que creamos
  
  posX = int(random(0, width));
  posY = int(random(0, height));
  color colorPuntillismo = miImagen.get(posX, posY);
  fill(colorPuntillismo);
  //ellipse(posX, posY, diametro, diametro);
  rectMode(CENTER);
  rect(posX, posY, diametro, diametro);
}
//Creando nuestra propia función
void probabilidad() {
  //Pedimos un número aleatorio entre 1 y 4
  int numeroActual = int(random(1, 5));
  //Serie condiciones o reglas de comportamiento del código
  if (numeroActual == 1) {//Si numeroActual es igual a uno, entonces...
    //Decimos el código que queremos ejecutar
    posX = posX + separacion;
    colorActual = #287ED1;//Azul
  } else if (numeroActual == 2) {//Si numeroActual es igual a uno, entonces...
    posX = posX - separacion;
    colorActual = #F0E479;//Amarillo
  } else if (numeroActual == 3) {//Si numeroActual es igual a uno, entonces...
    posY = posY - separacion;
    colorActual = #64A569;//Verde
  } else if (numeroActual == 4) {//Si numeroActual es igual a uno, entonces...
    posY = posY + separacion;
    colorActual = #ED4A58;//Rojo
  }
}
