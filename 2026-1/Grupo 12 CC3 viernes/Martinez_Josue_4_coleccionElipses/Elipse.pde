class Elipse {//Creamos a nuestra clase u objeto
  //Declarando a los campos(variables) que tendrá mi clase
  float posX, posY;
  float diametro;
  float velX;
  float velY;
  color colorActual; //Array = Arreglo | Colección de colores
  SoundFile audio; //Utilizaremos un SoundFile que nombramos audio
  String texto;
  Gif animacion;
  //Definir a nuestro constructor
  //constructor 1ra pasando datos
  Elipse() {
    posX = 200;
    posY = 200;
    diametro = 20;
    velX = 2;
    velY = 2;
    colorActual = #EA4839;
  }
  //Constructor 2da forma con datos que pasamos
  Elipse(float posX, float posY, float diametro, float velX, float velY, color colorActual) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.velX =velX;
    this.velY = velY;
    this.colorActual = colorActual;
  }
  //Constructor 3ra forma con datos que pasamos
  Elipse(float posX, float posY, float diametro, float velX, float velY, color colorActual, SoundFile audio, String texto, Gif animacion) {
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.velX =velX;
    this.velY = velY;
    this.colorActual = colorActual;
    this.audio = audio;
    this.texto = texto;
    this.animacion = animacion; //
  }
  //Métodos = Función o una acción
  void dibujar() {
    fill(colorActual);
    ellipse(posX, posY, diametro, diametro);
  }
  void vibrar() {
    posX = posX + random(-5, 5);
    posY = posY + random(-5, 5);
  }

  void desplazar() {
    posX = posX + velX;
    posY = posY + velY;
  }
  void rebotar() {
    //Evaluamos si la elipse esta dentro de el ancho
    if (posX > width-diametro/2 || posX < diametro/2) {
      velX = velX *-1;
      sonar();
    } else if (posY > height-diametro/2 || posY < diametro/2) {
      velY = velY *-1;
      sonar();
    }
  }
  void sonar() {
    //El primer argumento es el volumen entre 0 y 1
    //El segundo argumento L -1 y R +1 O EN C 0
    float pitch = map(this.diametro, 50, 150, 0.75, 1.25);
    float volumen = map(this.diametro, 50, 150, .25, 1);
    audio.play(pitch, volumen);
  }
  void textualidad() {
    textAlign(CENTER, CENTER);//Alineando el texto en el centro en horizontal y vertical
    //fill(255);
    text(this.texto, posX, posY);
  }
  void dibujarAnimacion() {
    imageMode(CENTER);
    image(animacion, posX, posY, diametro*0.9, diametro * 0.9);
  }
}
