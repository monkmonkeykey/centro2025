//Debemos nombrar la pestaña con el mismo nombre que la clase
class Elipse { // Definir a nuestra clase
  //Campos = Varibles
  float x, y, diametro, velocidad;
  int colorActual;
  Gif gatito;
  String nombre;
  //Constructor | Define las características de nuestro objeto
  //Debe tener el mismo nombre de nuestro objeto y/o clase
  Elipse(float tempX, float tempY, float tempDiametro, float tempVelocidad, int tempColor, Gif imagenTemporal, String tempNombre) {
    x = tempX;
    y = tempY;
    diametro = tempDiametro;
    velocidad = tempVelocidad;
    colorActual = tempColor;
    gatito = imagenTemporal;
    nombre = tempNombre; 
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
    imageMode(CENTER);
    image(gatito, x, y, diametro*0.85, diametro*0.85);
  }
  void dibujarTexto(){
    text(nombre, x + diametro, y + diametro);
  }
}
