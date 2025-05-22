color[] stripes = {#AEC6FF, #FFC0CB, #B39EB5}; // Naranja, azul, rosa
int stripeWidth = 10;
int cols;
int rows = 30;
int blockSize = 12;

void setup() {
  size(800, 600);
  cols = width / stripeWidth;
  noStroke();
}

void draw() {
  background(255);

  // Dibujar fondo de líneas verticales
  for (int i = 0; i < cols; i++) {
    fill(stripes[i % stripes.length]);
    rect(i * stripeWidth, 0, stripeWidth, height);
  }

  // Dibujar bloques curvos
  drawCurvedBlocks(height/4, 0.6, 0);
  drawCurvedBlocks(height/2, 0.4, PI/2);
  drawCurvedBlocks(height*3/4, 0.5, PI);
}

void drawCurvedBlocks(float yOffset, float amplitude, float phaseOffset) {
  for (int i = 0; i < cols - 1; i++) {
    float x = i * stripeWidth + stripeWidth/2;
    float y = yOffset + sin(i * 0.2 + phaseOffset) * amplitude * 100;
    fill(lerpColor(color(0), color(255), float(i) / cols)); // gradiente
    rect(x - blockSize/2, y - blockSize/2, blockSize, blockSize);
  }
}
