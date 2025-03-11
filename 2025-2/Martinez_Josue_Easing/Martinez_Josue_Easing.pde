float targetX, targetY;
float x, y;
float factorEasing = 0.0525;

void setup() {
  size(500, 500);
}

void draw() {
  background(127);
  easing();
}

void easing() {
  targetX = mouseX;//El punto donde queremos llegar
  targetY = mouseY;
  x += (targetX - x) * factorEasing;
  y += (targetY - y) * factorEasing;
  ellipse(x, y, 50, 50);
}
