class Mancha {
  float x, y, diametro, velocidad;
  int direccion = 1;
  PImage imagen;
  color colorObtenido;

  //Constructor
  Mancha (float x, float y, float diametro, float velocidad, PImage imagen, color colorObtenido) {
    /*this hace referencia al campo definido al inicio y guarda el valor
     del campo que le estoy pasando en el constructor.
     */
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.imagen = imagen;
    this.velocidad = velocidad;
  }
  //Métodos | Función | Acción escrita en código
  void dibujar() {
    colorear();
    ellipse(x, y, diametro, diametro);
  }
  void mover() {
    x = x + (velocidad * direccion);
    //Si existe una colisión, invierte la dirección.
    if (x <= diametro/2 || x >= width-diametro/2) {
      direccion = direccion * -1;
    }
  }
  void colorear() {
    colorObtenido = imagen.get(int(x), int(y));
    fill(colorObtenido);
  }
}
