float zoff = 0;

void setup() {
  size(800, 600);
}

void draw() {
  loadPixels();
  float yoff = 0;
  for (int y = 0; y < height; y++) {
    float xoff = 0;
    for (int x = 0; x < width; x++) {
      float n = noise(xoff, yoff, zoff);
      color skyBlue = color(135, 206, 250);
      color cloud = lerpColor(skyBlue, color(255), n);
      int index = x + y * width;
      pixels[index] = cloud;
      xoff += 0.01;
    }
    yoff += 0.01;
  }
  updatePixels();
  zoff += 0.01;
}
