import processing.video.*;
Capture camara;
String [] camaras = Capture.list();//Obtenemos los disposivos de captura disponibles
int columnas, filas;
int escala = 10; //Relación de escala 1:10
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
  if (camara.available()) {
    camara.read();
  }
  //image(camara, 0, 0);
  //Anidación
  for (int x = 0; x < camara.width; x++) {
    for (int y = 0; y < camara.height; y++) {
      int indice = x + y * camara.width; //obtener el pixel actual
      color c = camara.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float grises = (r + g + b) / 3;
      String frase = "qzawxsecdrvftbgynhuj/.,";
      int indiceActual = int(map(grises, 0, 255, 0, frase.length()-1));
      String letraActual = frase.substring(indiceActual, indiceActual+1);
      color colorInicio =#1AF507;
      color colorFinal = #F5070F;
      float porcentajeColor = map(grises, 0, 255, 0, 1);//obtener un porcentaje color
      color colorActual = lerpColor(colorInicio, colorFinal, porcentajeColor);
      fill(c);
      text(letraActual, x * escala, y * escala);
    }
  }
}
