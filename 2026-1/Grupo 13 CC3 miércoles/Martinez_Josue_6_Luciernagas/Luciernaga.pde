class Luciernaga {
  //Definimos los campos (variables) de la clase | Características
  float x, y;
  float velX, velY;
  float velocidad;
  float tono;
  float dimension;
  float parpadeo;

  //Constructor
  Luciernaga(float inicioX, float inicioY) {
    x = inicioX;
    y = inicioY;
    velX = random(-1, 1);
    velY = random(-1, 1);
    velocidad = random(0.5, 1.5);
    tono = random(61, 91);
    dimension = random(3, 8);
    parpadeo = random(1000); //1000ms = 1 seg
  }
  //Métodos
  void actualizar() {
    x += velX * velocidad;
    y += velY * velocidad;
    //Rebotar
    if (x <= 0 || x >= width-dimension) {
      velX *= -1;
    } else if (y <= 0 || y >= height-dimension) {
      velY *= -1;
    }
    velX  += random(-0.05, 0.05); //Vibrar
    velY  += random(-0.05, 0.05);
    //Contenemos la velocidad para que no aumente más de esto
    velX = constrain(velX, -1.5, 1.5);
    velY = constrain(velY, -1.5, 1.5);
    //Parpadeo
    parpadeo += 0.025;
  }
  void dibujar() {
    float brillo = (sin(parpadeo) * 0.5 + 0.5);
    //
    for (int i = 5; i > 0; i--) {
      float radio = dimension * i * 2;
      float alpha = map(i, 1, 5, 60, 10)* brillo;
      fill(tono, 70, 100, alpha);
      ellipse(x, y, radio, radio);
    }
    float alpha = map(frameCount%60, 1, 60, 60, 10)* brillo;
    fill(tono, 70, 100, alpha);
    ellipse(x, y, dimension*2, dimension*2);
  }
}
