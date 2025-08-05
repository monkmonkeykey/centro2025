class Elipse {//Definimos el bloque de la clase Elipse
  // Definimos los campos (variables) de la clase
  float x;
  float y;
  float diametro;
  float velocidad = 5.5;

  //Debemos definir variables y/o datos que serán momentaneos
  //Constructor
  Elipse(float tempX, float tempY, float tempDiametro) {
    x = tempX;
    y = tempY;
    diametro = tempDiametro;
  }
  //Método dibujar, dibujará a la elipse en la pantalla
  void dibujar() {
    fill(202, 85, 90);
    ellipse(x, y, diametro, diametro);
  }
  //Método que nos permite mover a nuestra elipse de forma aleatoria
  void vibrar() {
  void vibrar() {
    x += random(-velocidad, velocidad);
    y += random(-velocidad, velocidad);
  }
}
