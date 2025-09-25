class Elipse {
  //Definir los campos
  int posX, posY;
  int diametro;
  int velX;
  int velY;
  color colorActual; //Definir el color a nuestro Elipse
  SoundFile audio;
  //Constructor | Sirve para construir nuestro objeto con las carac. que definimos

  //Pensemos en un molde fijo
  Elipse() {
    posX = 50;
    posY = 50;
    diametro = 50;
    velX = 2;
    velY = 2;
    colorActual = #D84646;
  }
  //Sobrecarga de método
  Elipse(int posX, int posY, int diametro, int velX, int velY, color colorActual, SoundFile audio) {
    this.posX = posX; //Obtenemos momentamente el valor de posX que asignaremos
    this.posY = posY;
    this.diametro = diametro;
    this.velX = velX;
    this.velY = velY;
    this.colorActual = colorActual;
    this.audio = audio;
  }

  //Método = Función = Acción | ar, er, ir
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + int(random(-5, 5));
    posY = posY + int(random(-5, 5));
  }
  void rebotar() {
    if (posX >= width-diametro/2 || posX <= diametro/2) {
      velX = velX *-1;
      reproducirAudio();
      println("rebota x");
    } else  if (posY >= height-diametro || posY <= diametro) {
      velY = velY *-1;
      reproducirAudio();
      println("rebota y");
    }
  }
  void mover() {
    posX = posX + velX;
    posY = posY + velY;
  }
  void reproducirAudio() {
    audio.play();
  }
  void dibujarGif() {
    imageMode(CENTER);
    image(animacion, posX, posY, diametro* 0.85, diametro* 0.85);
  }
}
