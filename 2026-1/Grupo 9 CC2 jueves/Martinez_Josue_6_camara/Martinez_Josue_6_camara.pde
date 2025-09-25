import processing.video.*;

Capture camara; //el objeto para la entrada de video
//Obtenemos el nombre de todas las cámaras disponibles
String [] camaras = Capture.list(); //Cadenas de texto | Arrays , Colecciones
int columnas, filas;
int escala = 15;
String frase = "wxdecfrvgtbhynjumk,";
void setup() {
  size(1280, 720);//Resolución HD
  for (int i = 0; i < camaras.length; i++) {
    //camaras[0]; = webcam de la computadora
    //camaras[1]; = cámara del celular
    println(camaras[i]);
  }
  columnas = width/escala;
  filas = height/escala;
  camara = new Capture (this, columnas, filas, camaras[1]);
  camara.start();
}

void draw() {
  background(0);
  if (camara.available()) {
    camara.read();
  }
  //image(camara, 0, 0);
  for (int x = 0; x < camara.width; x++) {//Anidación de ciclos for
    for (int y = 0; y < camara.height; y++) {
      int indice = x + y * camara.width;
      color c = camara.pixels[indice]; //Obtener el color de cada pixel
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float grises = (r + g + b) / 3;
      int indiceActual = int(map(grises, 0, 255, 0, frase.length()-1));
      String letraActual = frase.substring(indiceActual, indiceActual+1);
      color colorInicio = #07F550;
      color colorFin = #F51B07;
      float porcentajeColor = map(grises, 0, 255, 0, 1);
      color colorActual = lerpColor(colorInicio, colorFin, porcentajeColor);
      fill(#12F507);
      text(letraActual, x * escala, y * escala);
    }
  }
}
