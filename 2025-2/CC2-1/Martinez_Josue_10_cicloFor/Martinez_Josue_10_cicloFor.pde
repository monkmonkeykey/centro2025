void setup() {
  //fullScreen();//Dibujar en el tamaño de nuestra pantalla completa
  size(1220, 800);
  colorMode(HSB, 360, 100, 100, 100);//canal alpha
}


void draw() {
  background(50);
  noStroke();
  for (int i = 20; i < 600; i = i+30) {
    int alpha = int(map(i, 20, 600, 100, 5));
    fill(i/2, 80, 90, alpha);
    ellipse(i, height/2, i/3, i/3);
  
  }
  for (int j = 630; j <= 1200; j= j+30) {
    int alpha = int(map(j, 630, 1200, 5, 100));
    int colorActual = int(map(j, 630, 1200, 360, 1));
    int tamaño = int(map(j, 630, 1200, 196, 6));

    fill(colorActual, 80, 90, alpha);
    ellipse(j, height/2, tamaño, tamaño);
    
  }

}
