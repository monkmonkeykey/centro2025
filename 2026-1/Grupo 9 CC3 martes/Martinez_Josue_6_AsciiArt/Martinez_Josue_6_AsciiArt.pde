import processing.video.*;



Capture camara;//Definir un objeto de captura de video

String [] camaras = Capture.list();//Dame el nombre de todos los devices de video
int columnas, filas;
int escala = 5; //1:10
void setup() {
  size(1280, 720);
  for (int i = 0; i < camaras.length; i++) {
    println(camaras[i]);
  }
  columnas = width/escala;
  filas = height/escala;
  camara = new Capture(this, columnas, filas, camaras[1]);
  camara.start();
}
void draw() {
  background(0);
  //Si esta disponible la cámara entonces, lee los pixeles
  if (camara.available()) {
    camara.read();
  }
  //image(camara, 0, 0);
  for (int x = 0; x < columnas; x++) {//Anidar un for
    for (int y = 0; y < filas; y++) {//Anidar un for
      int indice = x + y * camara.width;
      color c = camara.pixels[indice];
      float r  = red(c);
      float g  = green(c);
      float b  = blue(c);
      float grises = (r+g+b) / 3;
      String frase = "0123456789";
      int indiceLetra = int(map(grises, 0, 255, 0, frase.length()-1));
      String letraActual = frase.substring(indiceLetra, indiceLetra+1);
      color colorInicio = #266AED;
      color colorFinal = #ED0707;
      int porcentajeColor = int(map(grises, 0, 150, 0, 1));
      color colorActual = lerpColor(colorInicio, colorFinal, porcentajeColor);
      fill(colorActual);
      text(letraActual, x *escala, y * escala);
    }
  }
}
