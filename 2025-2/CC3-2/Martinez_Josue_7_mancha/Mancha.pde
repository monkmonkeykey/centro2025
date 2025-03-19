class Mancha {
  //Campos - Variables
  float x, y, diametro, velocidad;
  int direccion = 1;
  PImage imagen;
  color colorObtenido;
  //Constructor
  Mancha (float x, float y, float diametro, float velocidad) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.velocidad = velocidad;
  }
  //Constructor en sobre carga. Llamar a la misma clase con distinto #parametros
  Mancha (float x, float y, float diametro, float velocidad, PImage imagen) {
    this.x = x;
    this.y = y;
    this.diametro = diametro;
    this.velocidad = velocidad;
    this.imagen = imagen;
  }

  //Métodos
  void dibujar() {
    colorMode(HSB, 360, 100, 100, 100);//incluimos el canal alpha al final
    colorear();
    ellipse(x, y, diametro, diametro);
  }
  void mover() {
    x = x + (velocidad * direccion);
    //Si, existe una colisión en las esquinas horizontales, invierte la dirección
    if (x <= diametro/2 || x >= width-diametro/2) {
      direccion = direccion * -1;
    }
  }
  void colorear() {
    colorObtenido = imagen.get(int(x), int(y));
    fill(colorObtenido);
  }
}
