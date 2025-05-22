PImage img, deformada;
float waveAmplitude = 100;
float waveFrequency = 0.05;
float radius = 50;
float time = 0;

void setup() {
  size(500, 755);
  img = loadImage("2023 Completed Work I — Contemporary Mixed Media Artwork by M_ Dempsey Inspired by Nature and the Cosmos (1).jpeg");
  img.resize(width, height);
  deformada = img.copy();
}

void draw() {
  waveAmplitude = 100;
  waveFrequency = 0.05;
  radius = 50;
  background(0);

  if (mousePressed) {
    deformarZona(mouseX, mouseY);
  }

  // Aplica fluidez en toda la imagen (como derretido suave)
  efectoFluido();

  image(deformada, 0, 0);
  time += 0.1;
}

void deformarZona(int cx, int cy) {
  deformada.loadPixels();
  img.loadPixels();

  for (int y = max(1, cy - int(radius)); y < min(height - 1, cy + int(radius)); y++) {
    for (int x = max(1, cx - int(radius)); x < min(width - 1, cx + int(radius)); x++) {

      float dist = dist(x, y, cx, cy);
      if (dist < radius) {
        float offsetX = sin(y * waveFrequency + time) * waveAmplitude * (1 - dist / radius);
        float offsetY = cos(x * waveFrequency + time) * waveAmplitude * (1 - dist / radius);

        int sx = constrain(int(x + offsetX), 0, width - 1);
        int sy = constrain(int(y + offsetY), 0, height - 1);

        int srcIndex = sy * width + sx;
        int dstIndex = y * width + x;

        deformada.pixels[dstIndex] = img.pixels[srcIndex];
      }
    }
  }

  deformada.updatePixels();
}

// Simula un efecto de "fluidez" mezclando ligeramente píxeles vecinos
void efectoFluido() {
  deformada.loadPixels();

  for (int y = 1; y < height - 1; y++) {
    for (int x = 1; x < width - 1; x++) {
      int idx = y * width + x;
      int right = idx + 1;
      int down = idx + width;

      // Promedia un poco con vecinos para suavizar
      deformada.pixels[idx] = lerpColor(deformada.pixels[idx], deformada.pixels[right], 0.01);
      deformada.pixels[idx] = lerpColor(deformada.pixels[idx], deformada.pixels[down], 0.01);
    }
  }

  deformada.updatePixels();
}
