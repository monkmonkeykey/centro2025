PShader shader;
float click = 0;

void setup() {
  size(800, 800, P3D);
  shader = loadShader("frag.glsl");
  shader.set("resolution", float(width), float(height));
  noStroke();
}

void draw() {
  float t = millis() / 1000.0;
  shader.set("time", t);
  shader.set("mouse", (float)mouseX / width, (float)mouseY / height);
  shader.set("click", click);
  shader(shader);
  rect(0, 0, width, height);
}

void mousePressed() {
  click = 1;
}

void mouseReleased() {
  click = 0;
}
