Elipse[] elipses = new Elipse[2500];
String nombres[] = {"Renee", "Mafufi", "Verenice", "MaFer", "Juan"};
float posX, posY, diametro, velocidad;
int colorActual;
int elipsesActivas;
Elipse ultimaElipseActiva; // Referencia a la última elipse activa

void setup() {
  fullScreen();
  //size(800, 800);
  //textMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < elipses.length; i++) {
    diametro = random(5, 10);
    posX = random(diametro, width - diametro);
    posY = random(diametro, height - diametro);
    velocidad = random(1, 20);
    colorActual = int(random(0, 360));
    elipses[i] = new Elipse(posX, posY, velocidad, diametro, colorActual, nombres[i % nombres.length]);
  }
  noStroke();
}

void draw() {
  background(127);
  elipsesActivas = 0;
  ultimaElipseActiva = null; // Resetear la referencia en cada frame

  // Recorremos todas las elipses para contarlas y guardar la última activa
  for (int i = 0; i < elipses.length; i++) {
    if (elipses[i].activa) {
      elipses[i].dibujar();
      elipses[i].vibrar();
      elipses[i].rebotar();
      elipsesActivas++;
      ultimaElipseActiva = elipses[i]; // Guardar referencia de la última activa
    }
  }

  // Si solo queda una elipse activa, aplicamos el efecto de easing
  if (elipsesActivas == 1 && ultimaElipseActiva != null) {
    ultimaElipseActiva.activoVibrar = false; // Desactiva la vibración
    ultimaElipseActiva.moverAlCentro(); // Define el centro como objetivo
    ultimaElipseActiva.easing(); // Aplica la animación de easing
    ultimaElipseActiva.dibujar(); // Redibujar con la nueva posición

    ultimaElipseActiva.crecer();
  }

  println("Elipses activas: " + elipsesActivas);
}
