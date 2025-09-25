class Elipse { //Crear a nuestra clase o "molde"
  //Definimos las variables o campos de nuestra clase
  float posX, posY;
  float diametro;
  float velX;
  float velY;
  color colorActual;
  //Creamos a nuestro constructor
  //De obtener las caracteristicas con las cuales crearemos a nuestra "galleta"
  //Definiendo a las características
  Elipse() {
    posX = 300;
    posY = 250;
    diametro = 20;
    velX = 6;
    velY = 6;
    colorActual = #1B6BBF;
  }
  //Definimos los métodos o funciones de mi clase
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }

  void vibrar() {
    posX = posX + random(-velX, velX);
    posY = posY + random(-velY, velY);
  }

  void desplazar() {
    posX = posX + 2;
    posY = posY + 2;
  }
}
