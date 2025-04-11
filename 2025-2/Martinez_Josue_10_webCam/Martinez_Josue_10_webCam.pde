import processing.video.*;
PFont miFuente ;
int escala = 10;
int columnas, filas; //Definimos variables
Capture webcam;  //Definimos al objeto que capturara la imagen desde la cámara
String[] cameras = Capture.list();//Arreglo y/o colección de cámaras disponibles
String texto = "d1re2ftygdubhqwjcnksa.,/";
void setup() {
  size(1280, 720);
  columnas = width/ escala;
  filas = height/escala;
  miFuente = createFont("Georgina", 12);
  textAlign(CENTER, CENTER);
  textFont(miFuente);
  webcam = new Capture(this, columnas, filas);
  webcam.start();//Inicializamos la cámara
  for (int i =0; i < cameras.length; i++) {
    println (cameras[i]);
  }
}
void draw() {
  fill(0);
  rect(0, 0, width, height);
  if (webcam.available() ) {//si, la cámara esta disponible, quiero leer los pixeles
    webcam.read();
  }
  for (int x = 0; x < webcam.width; x++) {
    for (int y = 0; y < webcam.height; y++) {
      int indice = x + y * webcam.width;
      color c = webcam.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float brillo = (r + g + b) / 3;
      int indiceLetras = int(map(brillo, 0, 255, texto.length() -1, 0));
      String letraActual = texto.substring(indiceLetras, indiceLetras + 1);
      //textSize(random(10, 25));
      fill(brillo);
      text(letraActual, x * escala, y * escala);
    }
  }
}
