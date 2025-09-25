import processing.video.*;
Capture camara; //el objeto que me va a permitir capturar a través de la cámara
int columnas, filas;
int escala = 10;
String [] camaras = Capture.list();
String frase = "q2w3aed4thfyguiopl´ñ}+p'¿o0iu/";
void setup() {
  size(1280, 720);//HD
  for (int i = 0; i < camaras.length; i++) {
    println(camaras[i]);
  }
  columnas = width/escala;
  filas = height/escala;
  camara = new Capture(this, columnas, filas, camaras[1]);
  camara.start();
}

void draw() {
  camara.read();
  //image(camara, 0, 0);
  background(0);
  for (int x = 0; x < columnas; x++) {//Recorremos pixeles en X
    for (int y = 0; y <filas; y++) {//Recorremos pixeles en Y
      int indice = x + y * camara.width;
      color c = camara.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float grises = (r + g + b) / 3  ;
      int letraActual =  int(map(grises, 0, 255, frase.length()-1, 0));
      String letraADibujar = frase.substring(letraActual, letraActual+1);
      fill(c);
      text(letraADibujar, x * escala, y * escala);
    }
  }
}
