import processing.video.*;
int escala =10;
int columnas, filas; //Inicializamos las variables
Capture webcam;
String [] camaras = Capture.list(); //El listado de cámaras disponibles
String texto = "lur98n234hjr8932m";//Libre. el texto que quieran.
void setup() {
  size(1280, 720);
  columnas = width/escala;
  filas = height/escala;
  webcam = new Capture(this, camaras[1]); //Creamos la cámara y definimos la res
  webcam.resize(columnas, filas);
  for (int i = 0; i < camaras.length; i++) {
    println(camaras[i]);
  }
  webcam.start();//Iniciamos la cámara
}

void draw() {
  background(255);
  if (webcam.available()) {//Si la cámara está disponible... lee los datos
    webcam.read();
  }

  for (int x = 0; x < webcam.width; x++) {
    for (int y = 0; y < webcam.height; y++) {
      int indice = x + y * webcam.width; //Obtenemos el número de cada pixel
      color c = webcam.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float brillo = (r + g + b) / 3;
      int indiceLetras = int(map(brillo, 0, 255, texto.length() - 1, 0));
      String letraActual = texto.substring(indiceLetras, indiceLetras + 1);

      fill(c);
      text(letraActual, x * escala, y * escala);
    }
  }
}
