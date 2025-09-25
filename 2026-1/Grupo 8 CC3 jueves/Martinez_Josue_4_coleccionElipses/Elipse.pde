class Elipse {
  // Definir las variables, los campos de nuestra clase pero sin darles valor
  int posX, posY;
  int diametro;
  int intensidadVibracion;
  color colorActual;
  int velX, velY; //definimos variables para la velocidad
  SoundFile audio;
  Gif animacion;
  boolean dentro = true;
  int contadorDentro;
  //Constructor es el molde de la galleta o en este caso de la elipse
  Elipse() {
    posX = 100;
    posY = 200;
    diametro = 20;
    intensidadVibracion = 7;
    colorActual = #6491B7;
  }
  //Crear un nuevo constructor que va a recibir datos
  Elipse(int posX, int posY, int diametro, int intensidadVibracion, color colorActual, int velX, int velY, SoundFile audio, Gif animacion) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.intensidadVibracion = intensidadVibracion;
    this.colorActual = colorActual;
    this.velX = velX;
    this.velY = velY;
    this.audio = audio;
    this.animacion = animacion;
  }
  //Acciones o Métodos = Funciones
  void dibujar() {
    if (dentro) {
      fill(colorActual);
      ellipse(posX, posY, diametro, diametro);
    }
  }
  void vibrar() {
    posX = posX + int(random(-intensidadVibracion, intensidadVibracion));
    posY = posY + int(random(-intensidadVibracion, intensidadVibracion));
  }
  void mover() {
    posX = posX + velX;
    posY = posY + velY;
  }
  void rebotar() {
    if (posX >= width-diametro/2 || posX <= diametro/2) {
      velX *= -1;
      reproducirAudio();
      animacion.play();
    } else if (posY >= height-diametro/2 || posY <= diametro/2) {
      velY *= -1;
      reproducirAudio();
      animacion.play();
    }
  }
  void reproducirAudio() {

    if (this.audio.isPlaying() == false) {
      audio.play();
    }
  }
  void dibujarAnimacion() {
    imageMode(CENTER);//Dibujamos la imagen a partir de su centro
    image(animacion, posX, posY, diametro * 0.9, diametro * 0.9);
  }
  void limitar() {
    if (posX > 0 && posX < width && posY > 0 && posY < height) {
      dentro = true;
    } else {
      dentro = false;
    }
  }
  void contar() {
    if (dentro) {
      contadorDentro=1;
    } else if (dentro == false) {
      contadorDentro--;
    }
  }
}
