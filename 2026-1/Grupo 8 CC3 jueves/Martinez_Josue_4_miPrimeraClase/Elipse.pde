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
  //Acciones o Métodos = Funciones
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + int(random(-intensidadVibracion, intensidadVibracion));
    posY = posY + int(random(-intensidadVibracion, intensidadVibracion));
  }
}
