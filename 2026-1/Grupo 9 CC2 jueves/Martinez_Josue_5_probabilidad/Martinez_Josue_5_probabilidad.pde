int diametro = 5;
int separacion = 5;
color colorActual;//Inicializamos la variable su valor será de
int posX, posY;
//Se ejecuta/dibuja solo una vez
void setup() {
  size(1280, 720); // tamaño de nuestro canvas
  colorMode(HSB, 360, 100, 100);
  //ellipse(width/2, height/2, 50, 50);
  posX = width/2;
  posY = height/2;
}
//dibujar 60 veces por segundo
void draw() {
  noStroke();
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
  }else if (numeroActual == 4) {//Si numeroActual es igual a uno, entonces...
    posY = posY + separacion;
    colorActual = #ED4A58;//Rojo
  }
  fill(colorActual);
  ellipse(posX, posY, diametro, diametro);
}
