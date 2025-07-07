import processing.video.*;

int escala = 10;
int columnas, filas;
Capture webcam;
String texto = "awserdtfyguhijoklpñ´+},./";

void setup() {
  size(1280, 720);
  columnas = width/ escala;
  filas = height / escala;
  textAlign(CENTER, CENTER);
  webcam = new Capture (this, columnas, filas);
  webcam.start();
}

void draw() {
  background(0);
  if (webcam.available()) {
    webcam.read();
  }
  println(webcam.width);
  for (int x = 0; x < webcam.width; x++ ) {
    for (int y = 0; y < webcam.height; y++ ) {
      int indice = x + y * webcam.width;
      color c = webcam.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float brillo = (r + g + b) / 3;
      int indiceLetras = int(map(brillo, 0, 255, texto.length()-1, 0));
      String letraActual = texto.substring(indiceLetras, indiceLetras + 1);
      fill(3, 255, 4);
      text(letraActual, x * escala, y * escala);
    }
  }
}
