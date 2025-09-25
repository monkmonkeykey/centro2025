void setup() {
  //fullScreen();
  size(720, 500);
  colorMode(HSB, 360, 100, 100);
  //1ra | variable que será iterada la debemos de inicializar con un valor
  //2da | Condición. Mientras que... i sea menor que el valor del ancho...
  //3ra | La forma en la cual se suma o resta la variable
  /*
  for (int i = 0; i < width; i+= 5) {
   println(i);
   line(i, 0, i, height);
   }
   for (int j = 0; j < height; j+= 5) {
   println(j);
   line(0, j, width,j);
   }
   */
  //Genera líneas de fondo como degradado
  for (int i = 0; i < width; i+= 1) {
    //println(i);
    float colorLinea = map(i, 0, width, 360,280);
    stroke(colorLinea, 100, 100);
    line(i, 0, i, height);
  }
  //Dibujar ellipses
  noStroke();

  for (int j = 1; j < 15; j+= 1) {
    float colorEllipses = map(j, 1, 15, 180, 245);
    fill(colorEllipses, 80, 80);
    ellipse(j*20, height/2, 10*j, 10*j);
  }

  for (int k = 15; k > 1; k-= 1) {
    float colorEllipses = map(k, 15, 1, 245, 180);
    fill(colorEllipses, 80, 80);
    float dimension = map(k, 15, 1, 1, 15);
    ellipse(400+k*20, height/2, 10*dimension, 10*dimension);
    println(320+k*20);
  }
}
