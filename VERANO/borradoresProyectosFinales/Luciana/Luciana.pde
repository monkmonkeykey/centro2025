import processing.video.*;

Movie siluetaVideo;     // Video con la mariposa o cuerpo
Movie coloresVideo;     // Video que dará los colores
PGraphics mascara;

void setup() {
  size(412, 502);

  // Carga de videos
  siluetaVideo = new Movie(this, "SiluetaGirando.mp4");
  coloresVideo = new Movie(this, "VideoFinal.mp4");

  siluetaVideo.loop();
  coloresVideo.loop();
  siluetaVideo.volume(0);
  mascara = createGraphics(width, height);
  frameRate(24);
  background(0);
}

void draw() {
  // Dibuja fondo negro con transparencia para dejar estela
  fill(0, 15);  // 20 es la opacidad, prueba con valores entre 10 y 50
  rect(0, 0, width, height);

  if (siluetaVideo.available()) {
    siluetaVideo.read();
  }

  if (coloresVideo.available()) {
    coloresVideo.read();
  }

  // Crear la máscara a partir del video de silueta
  mascara.beginDraw();
  mascara.image(siluetaVideo, 0, 0, width, height);
  mascara.filter(GRAY);
  mascara.endDraw();

  // Cargar pixeles
  coloresVideo.loadPixels();
  mascara.loadPixels();
  loadPixels();

  for (int i = 0; i < pixels.length; i++) {
    float alpha = brightness(mascara.pixels[i]);
    if (alpha < 10) {
      pixels[i] = coloresVideo.pixels[i];
    }
    // Nota: ya no se pinta fondo negro aquí, porque lo hace la capa con `fill(0, 20)`
  }

  updatePixels();
}
