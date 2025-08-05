class Elipse {//Definimos el bloque de la clase Elipse
  // Definimos los campos (variables) de la clase
  float x;
  float y;
  float diametro;
  float velocidad;
  int colorActual;
  PImage imagen;

  //Debemos definir variables y/o datos que serán momentaneos
  //Constructor
  Elipse(float tempX, float tempY, float tempDiametro, float tempVelocidad, int tempColorActual, PImage tempImagen) {
    x = tempX;
    y = tempY;
    diametro = tempDiametro;
    velocidad = tempVelocidad;
    colorActual = tempColorActual;
    imagen = tempImagen;
  }
  //Método dibujar, dibujará a la elipse en la pantalla
  void dibujar() {
    fill(colorActual, 85, 90);
    ellipse(x, y, diametro, diametro);
  }
  //Método que nos permite mover a nuestra elipse de forma aleatoria
  void vibrar() {
    x += random(-velocidad, velocidad);
    y += random(-velocidad, velocidad);
  }

  void mostrarImagen() {
      imageMode(CENTER);
    image(imagen, x, y, diametro * 0.85, diametro * 0.85);
  }
}
