class Elipse {
  float x, y, velocidad, diametro;
  int colorActual;
  boolean activa = true;
  String nombre;
  boolean activoVibrar = true;
  float easing = 0.025;
  float separacionTexto;
  float targetX, targetY; // Objetivo de movimiento

  Elipse(float tempX, float tempY, float tempVelocidad, float tempDiametro, int tempColorActual, String tempNombre) {
    x = tempX;
    y = tempY;
    velocidad = tempVelocidad;
    diametro = tempDiametro;
    colorActual = tempColorActual;
    nombre = tempNombre;

    targetX = x;  // Inicialmente, la posición objetivo es la misma que la posición actual
    targetY = y;
  }

  void dibujar() {
    if (activa) {


      fill(colorActual, 90, 90);
      ellipse(x, y, diametro, diametro);
      fill(360);
      text(nombre, x + separacionTexto, y+ separacionTexto);
    }
  }

  void vibrar() {
    if (activoVibrar) {
      x = x + random(-velocidad, velocidad);
      y = y + random(-velocidad, velocidad);
    }
  }

  void rebotar() {
    if (x >= width || x <= 0) {
      activa = false;
      x = x * -1;
    } else if (y >= height || y <= 0) {
      y = y * -1;
      activa = false;
    } else {
      activa = true;
    }
  }

  void easing() {
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
  }

  void moverAlCentro() {
    targetX = width / 2;
    targetY = height / 2;
  }
  void crecer() {
    diametro++;
    println(diametro);
    separacionTexto = 0;
    if (diametro >= 200) {
      noLoop();
    }
  }
}
