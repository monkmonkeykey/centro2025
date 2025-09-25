import processing.video.*;

Capture camara;
String [] camaras = Capture.list(); //Guardamos una colección de cámaras disponibles
int columnas, filas;
int escala = 10; //Relación 1:10
void setup() {
  size(1280, 720); //HD
  //1. Variable que itera o repite
  //2. Hasta cuando se repite con una condición
  //3. Como se modifica el valor de la varible. Suma, resta
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
  //For anidado
  for (int x = 0; x < camara.width; x++) {
    for (int y = 0; y < camara.height; y++) {
      int indice = x + y * camara.width;
      color c = camara.pixels[indice];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float grises = (r + g + b) / 3;
      String frase = "0123456789";
      int indiceLetra = int(map(grises, 0, 255, 0, frase.length()-1));
      String letraActual = frase.substring(indiceLetra, indiceLetra+1);
      color colorInicio = #3E64C1;
      color colorFinal = #E35955;
      int porcentajeColor = int(map(grises, 0, 255, 0, 1));
      color colorActual = lerpColor(colorInicio, colorFinal, porcentajeColor);
      fill(colorActual);
      text(letraActual, x * escala, y * escala);
    }
  }
}
