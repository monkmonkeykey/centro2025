PImage img, nuevaImg;
float tiempo = 0;

void setup() {
  size(1280, 720);
  img = loadImage("Torres_Hiram_Boceto1.jpg");
  nuevaImg = createImage(img.width, img.height, RGB);
  noSmooth(); // para conservar detalle de pixelado si es deseado
}

void draw() {
  img.loadPixels();
  nuevaImg.loadPixels();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int i = x + y * img.width;
      color c = img.pixels[i];

      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float newR = r;
      float newG = g;
      float newB = b;

      if (b > r && b > g) {
        newR = map(b, 0, 255, r, 255);
        newG = map(b, 0, 255, g, 100);
        newB = map(b, 0, 255, b, 150);
      }

      // Aquí hacemos que el cambio dependa del ruido + tiempo
      float n = noise(x * 0.01, y * 0.01, tiempo);
      float t = constrain(n, 0, 1);

      float finalR = lerp(r, newR, t);
      float finalG = lerp(g, newG, t);
      float finalB = lerp(b, newB, t);

      nuevaImg.pixels[i] = color(finalR, finalG, finalB);
    }
  }

  nuevaImg.updatePixels();
  image(nuevaImg, 0, 0, width, height);

  tiempo += 0.01; // velocidad del avance orgánico
}
