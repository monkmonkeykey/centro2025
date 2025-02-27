boolean hambre = true;//Guarda un estado de verdad. El cual puede ser false o true
float posX, posY;
float diametro = 7;
float espacio = 9;
float colorActual;
int numeroAleatorio;

void setup() {
  fullScreen();
  //size(500, 500);
  colorMode(HSB, 360, 100, 100);//Definimos el modo de color en HSB
  posX = width/2;
  posY = height/2;
}

void draw() {
  // == | Igual qué
  //Si... hambre es igual a verdadero, entonces ejecuta el código
  numeroAleatorio = int(random(4));//obtener de forma aleatorio valores en 0-4
  if (numeroAleatorio == 0) {//Si el valor es verdadero entonces, colorea de rojo
    fill(0, 95, 95);
    posX = posX + espacio;
  } else if (numeroAleatorio == 1) {//Si el valor es verdadero entonces, colorea de rojo
    fill(65, 95, 95);
    posX = posX - espacio;
  } else if (numeroAleatorio == 2) {//Si el valor es verdadero entonces, colorea de rojo
    fill(233, 95, 95);
    posY = posY - espacio;
  } else if (numeroAleatorio == 3) {//Si el valor es verdadero entonces, colorea de rojo
    fill(123, 95, 95);
    posY = posY + espacio;
  }
  ellipse(posX, posY, diametro, diametro);
}
