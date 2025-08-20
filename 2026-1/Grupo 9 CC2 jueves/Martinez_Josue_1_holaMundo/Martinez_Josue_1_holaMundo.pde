void setup() { //Esta estructura me permite definir la configuración inicial del sketch
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {//Por defecto se intentará dibujar 60 veces por segundo
  fill(random(360), 80, 80);
  ellipse(mouseX, mouseY, frameCount%50, frameCount%50);
  
}
