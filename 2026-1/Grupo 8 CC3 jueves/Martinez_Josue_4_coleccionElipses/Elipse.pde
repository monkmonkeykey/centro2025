class Elipse {
  // Definir las variables, los campos de nuestra clase pero sin darles valor
  int posX, posY;
  int diametro;
  int intensidadVibracion;
  color colorActual;
  //Constructor es el molde de la galleta o en este caso de la elipse
  Elipse() {
    posX = 100;
    posY = 200;
    diametro = 20;
    intensidadVibracion = 7;
    colorActual = #6491B7;
  }
  //Crear un nuevo constructor que va a recibir datos
  Elipse(int posX, int posY, int diametro, int intensidadVibracion, color colorActual) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.intensidadVibracion = intensidadVibracion;
    this.colorActual = colorActual;
  }
  //Acciones o Métodos = Funciones
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + int(random(-intensidadVibracion, intensidadVibracion));
    posY = posY + int(random(-intensidadVibracion, intensidadVibracion));
  }
  void mover() {
    posX = posX + 1;
    posY = posY + 1;
  }
}
