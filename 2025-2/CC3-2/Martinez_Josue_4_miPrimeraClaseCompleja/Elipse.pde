class Elipse {//Definimos el bloque de la clase Elipse
  // Definimos los campos (variables) de la clase
  float x;
  float y;
  float diametro;
  float velocidad;
  int colorActual;
  boolean vibrarActivo = true;
  boolean dibujarActivo = true;
  String nombre;
  int separacion = 5;
  float targetX, targetY;
  float factorEasing = 0.025;
  PImage imagen;
  //Debemos definir variables y/o datos que serán momentaneos
  //Constructor
  Elipse(float tempX, float tempY, float tempDiametro, float tempVelocidad, int tempColorActual, String tempNombre, PImage tempImagen) {
    x = tempX;
    y = tempY;
    diametro = tempDiametro;
    velocidad = tempVelocidad;
    colorActual = tempColorActual;
    nombre = tempNombre;
    targetX = x;
    targetY = y;
    imagen = tempImagen;
  }
  //Método dibujar, dibujará a la elipse en la pantalla
  void dibujar() {
    if (dibujarActivo) {
      fill(colorActual, 85, 90);
      ellipse(x, y, diametro, diametro);
      dibujarImagen();
    }
  }
  void dibujarImagen() {
    if (imagen != null) {
      imageMode(CENTER);
      image(imagen, x, y, diametro *0.75, diametro *0.75);
    }
  }
  //Método que nos permite mover a nuestra elipse de forma aleatoria
  void vibrar() {
    if (vibrarActivo) {

      x += random(-velocidad, velocidad);
      y += random(-velocidad, velocidad);
    }
  }
  void desbordar() {
    if (x >= width || x <= 0) {
      vibrarActivo = false;
      dibujarActivo= false;
    } else if (y >= height || y <= 0) {
      vibrarActivo = false;
      dibujarActivo = false;
    }
  }

  void mostrarNombre() {
    fill(360);
    text(nombre, x + separacion, y + separacion);
  }
  void centrar() {
    targetX = width/2;
    targetY = height/2;
  }
  void easing() {
    x += (targetX - x) * factorEasing;
    y += (targetY - y) * factorEasing;
  }
  void crecer() {
    diametro += 0.25;
    separacion = 0;
    if (diametro >=200) {
      noLoop();
      
    }
  }
}
