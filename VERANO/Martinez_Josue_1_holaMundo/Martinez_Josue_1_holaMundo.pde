void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  fill(mouseX%360, 80, 100);
  
  text("hola mundo", random(50,width-50), random(50,height-50));
}
