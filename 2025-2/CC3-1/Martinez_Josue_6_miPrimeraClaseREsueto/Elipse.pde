//Debemos nombrar la pestaña con el mismo nombre que la clase
import gifAnimation.*;

class Elipse { // Definir a nuestra clase
  //Campos = Varibles
  float x, y, diametro, velocidad;
  int colorActual;
  PImage imagen;
  Gif gatito;

  //Constructor | Define las características de nuestro objeto
  //Debe tener el mismo nombre de nuestro objeto y/o clase
  Elipse(float tempX, float tempY, float tempDiametro, float tempVelocidad, int tempColor, Gif imagenTemporal) {
    x = tempX;
    y = tempY;
    diametro = tempDiametro;
    velocidad = tempVelocidad;
    colorActual = tempColor;
    gatito = imagenTemporal;
  }

  //Métodos = Funciones
  void dibujar() {
    fill(colorActual, 90, 90);
    ellipse(x, y, diametro, diametro);
  }
  void vibrar() {
    x = x + random(-velocidad, velocidad);
    y = y + random(-velocidad, velocidad);
  }
  void dibujarImagen() {

    image(gatito, x, y);
  }
}
