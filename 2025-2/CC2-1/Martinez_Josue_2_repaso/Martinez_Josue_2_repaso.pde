PImage fondo; 
char[] letras = {'j', 'o', 's', 'u', 'e', 'r', '3', '$'}; 
ArrayList<LetraRotante> letrasRotantes = new ArrayList<LetraRotante>();
int espaciado = 20; // Tamaño de la cuadrícula (menor número = más letras)
void setup() {
  size(1280, 720);
  fondo = loadImage("0.jpg"); 
  fondo.loadPixels(); // Cargar los píxeles de la imagen
  textSize(espaciado);

  // Generar las letras en cada píxel de la cuadrícula
  for (int y = 0; y < height; y += espaciado) {
    for (int x = 0; x < width; x += espaciado) {
      int index = y * width + x;
      if (index < fondo.pixels.length) {
        color colorActual = fondo.pixels[index]; // Obtener el color del píxel
        char letra = letras[int(random(letras.length))]; // Letra aleatoria
        letrasRotantes.add(new LetraRotante(x, y, letra, colorActual));
      }
    }
  }
}

void draw() {
  background(0);
  for (LetraRotante letra : letrasRotantes) {
    letra.mover(mouseX, mouseY);
    letra.dibujar();
  }
}

// Clase que representa cada letra en un píxel
class LetraRotante {
  float x, y;
  float xOriginal, yOriginal;
  char letra;
  color col;
  float angulo;
  
  LetraRotante(int x, int y, char letra, color col) {
    this.x = x;
    this.y = y;
    this.xOriginal = x; // Guardar la posición original
    this.yOriginal = y;
    this.letra = letra;
    this.col = col;
    this.angulo = random(TWO_PI);
  }
  
  void mover(float mx, float my) {
    float distancia = dist(mx, my, xOriginal, yOriginal); // Distancia al mouse
    float fuerza = map(distancia, 0, 200, 20, 0); // Ajustar fuerza
    
    // Calcular dirección de movimiento
    float anguloMouse = atan2(yOriginal - my, xOriginal - mx);
    
    // Mover la letra lejos del mouse
    x = xOriginal + cos(anguloMouse) * fuerza;
    y = yOriginal + sin(anguloMouse) * fuerza;
    
    angulo += radians(1); // Mantener rotación
  }
  
  void dibujar() {
    pushMatrix();
    translate(x, y);
    rotate(angulo);
    fill(col);
    textAlign(CENTER, CENTER);
    text(letra, 0, 0);
    popMatrix();
  }
}
