String textoOriginal = "Mi gAto tiene sueño"; //Texto a modificar
String textoModificado = ""; //Aquí se guarda el texto modificado
PFont fuente; // Definimos al objeto Font

void setup() {
  size(1280, 720);
  fuente = createFont("RobotoMono-Medium.ttf", 36);
  textFont(fuente);
  textAlign(CENTER, CENTER);
  textoModificado = codificaTexto(textoOriginal);
}

void draw() {
  fill(50, 50);
  rect(0, 0, width, height);

  float espacio = width / (textoModificado.length() + 1);

  for (int i = 0; i < textoModificado.length(); i++) {
    char letra = textoModificado.charAt(i); //Obtenemos las letras

    float x = espacio * (i + 1);
    float y = height / 2;
    float rotacion = sin(frameCount * 0.02 + i * 0.02) * 360;
    fill(255);
    pushMatrix(); //Definimos donde queremos comenzar las transformaciones
    translate(x, y);
    rotate(radians(rotacion));
    text(letra, 0, 0);
    popMatrix();//Definimos donde queremos terminar las transformaciones
  }
}


// Funciones que retornan un dato
//Procesar al texto
String codificaTexto(String texto) {
  texto = texto.replace("a", "afa");
  texto = texto.replace("e", "efe");
  texto = texto.replace("i", "ifi");
  texto = texto.replace("o", "ofo");
  texto = texto.replace("u", "ufu");

  texto = texto.replace("A", "Afa");
  texto = texto.replace("E", "Efe");
  texto = texto.replace("I", "Ifi");
  texto = texto.replace("I", "Ofo");
  texto = texto.replace("U", "Ufu");
  return texto;
}
