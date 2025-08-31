int posX, posY, velX, velY, diametro;

color [] colores = {#29555A, #47A751, #6F47A7, #47A797, #BF403A, #E0DC5B};
Elipse [] elipses= new Elipse[10000]; //definimos un array de Pelota y le indicamos su longitud

void setup() {
  //size(600, 600);
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < elipses.length; i++) {
    //Obtiene en cada vuelta un valor aleatorio entre el radio(5) y el ancho menos radio (600-5)
    diametro = int(random (5, 15));
    posX = int(random(diametro/2, width-diametro/2));
    posY = int(random(diametro/2, height-diametro/2));
    velX = int(random(1, 10));
    velY = int(random(1, 10));

    //En este momento accedemos al índice del array pelotas y asignamos a cada una características distntas
    elipses [i] = new Elipse(posX, posY, diametro, velX, velY, colores[i%colores.length]);
  }
}

void draw() {
  background(0);
  for (int j = 0; j < elipses.length; j++) {
    elipses[j].dibujar();
    elipses[j].vibrar();
  }
}
