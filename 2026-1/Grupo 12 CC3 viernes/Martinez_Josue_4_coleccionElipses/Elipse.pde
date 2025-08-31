class Elipse {//Creamos a nuestra clase u objeto
  //Declarando a los campos(variables) que tendrá mi clase
  float posX, posY;
  float diametro;
  float velX;
  float velY;
  color colorActual; //Array = Arreglo | Colección de colores
  //Definir a nuestro constructor
  //constructor 1ra pasando datos
  Elipse() {
    posX = 200;
    posY = 200;
    diametro = 20;
    velX = 2;
    velY = 2;
    colorActual = #EA4839;
  }
  //Constructor 2da forma con datos que pasamos
  Elipse(float posX, float posY, float diametro, float velX, float velY,color colorActual) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.velX =velX;
    this.velY = velY;
    this.colorActual = colorActual;
  }
  //Métodos = Función o una acción
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + random(-5, 5);
    posY = posY + random(-5, 5);
  }

  void desplazar() {
    posX = posX + velX;
    posY = posY + velY;
  }
}
