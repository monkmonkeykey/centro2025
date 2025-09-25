class Elipse { //Crear a nuestra clase o "molde"
  //Definimos las variables o campos de nuestra clase
  float posX, posY;
  float diametro;
  float velX;
  float velY;
  color colorActual;
  SoundFile audio;//Agregamos un audio
  String miTexto;
  //Creamos a nuestro constructor
  //De obtener las caracteristicas con las cuales crearemos a nuestra "galleta"
  //Definiendo a las características
  Elipse() {
    posX = 300;
    posY = 250;
    diametro = 20;
    velX = 6;
    velY = 6;
    colorActual = #1B6BBF;
  }

  Elipse(float posX, float posY, float diametro, float velX, float velY, color colorActual, SoundFile audio, String miTexto) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.velX = velX;
    this.velY = velY;
    this.colorActual = colorActual;
    this.audio = audio;
    this.miTexto = miTexto;
  }
  //Definimos los métodos o funciones de mi clase
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }

  void vibrar() {
    posX = posX + random(-5, 5);
    posY = posY + random(-5, 5);
  }

  void desplazar() {
    posX = posX + velX; //Cambiamos el valor por velX
    posY = posY + velY; //Cambiamos el valor por velY
  }
  void rebotar() {
    //Hacer una colisión
    if (posX >= width-diametro || posX < diametro) {
      velX = velX *-1;//Cambia la dirección
      sonar();
    } else if (posY >= height-diametro || posY < diametro) {
      velY = velY *-1;//Cambia la dirección
      sonar();
    }
  }
  void sonar() {
    audio.play();
  }
  void escribir() {
    textAlign(CENTER, CENTER);
    text(miTexto, posX, posY);
  }
}
