class Elipse {
  //Definir los campos
  int posX, posY, diametro, velX, velY;
  color colorActual;
  //Constructor | Sirve para construir nuestro objeto con las carac. que definimos
  //Pensemos en un molde fijo
  Elipse() {
    posX = 50;
    posY = 50;
    diametro = 50;
    velX = 2;
    velY = 2;
  }
  //Constructor | Sirve para construir nuestro objeto con las carac. que definimos
  //Pensemos en un molde fijo
  Elipse(int posX, int posY, int diametro, int velX, int velY, color colorActual) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.velX = velX;
    this.velY = velY;
    this.colorActual = colorActual;
  }

  //Método = Función = Acción | ar, er, ir
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + int(random(-5, 5));
    posY = posY + int(random(-5, 5));
  }
  void rebotar() {
    if (posX >= width-diametro/2 || posX <= diametro/2) {
      velX = velX *-1;
      println("rebota x");
    } else  if (posY >= height-diametro || posY <= diametro) {
      velY = velY *-1;
      println("rebota y");
    }
  }
  void mover() {
    posX = posX + velX;
    posY = posY + velY;
  }
}
