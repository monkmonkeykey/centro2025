import processing.video.*;

Capture camara; //Este dato/Objeto nos permite capturar la imagen de algo
String [] camaras = Capture.list(); //Cadena texto donde se guardarán las cámaras disponibles
PFont fuente;//Cargar y usar fonts
String texto = "mafufi";
int escala = 10;
int filas, columnas;
void setup() {
  size(1280, 720); //Definimos el canvas en relación a la resolución de cámara
  filas = height/escala;
  columnas = width/escala;
  fuente = createFont("Roboto_Condensed-Regular.ttf", 12);
  for (int i = 0; i < camaras.length; i++) {
    println(camaras[i]); //
  }
  camara = new Capture(this, columnas, filas);
  camara.start();
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  if (camara.available()) {
    camara.read();
  }
  for (int x = 0; x < camara.width; x++) {
    for (int y = 0; y < camara.height; y++) {
      int indice = x + y * camara.width;
      color c = camara.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float grises = (r + g + b) / 3;
      int indiceLetras = int(map(grises, 0, 255, texto.length()-1, 0));
      String letraActual = texto.substring(indiceLetras, indiceLetras + 1);
      fill(r, g, b);
      text(letraActual, x * escala, y * escala);
    }
  }
  //  image(camara, 0, 0);
}
