import processing.sound.*;
SoundFile audio;
ArrayList <Luciernaga> enjambre;
boolean estela = true;
int numLuciernagas = 30;//Número de luciernagas al inicio
void setup() {
  size(600, 600);
  //fullScreen();
  audio = new SoundFile(this, "luciernagas.mp3");
  audio.loop();
  colorMode(HSB, 360, 100, 100, 100);
  smooth(4);//Suavizar los bordes de lo que dibujamos
  noStroke();
  enjambre = new ArrayList<Luciernaga>();
  for (int i = 0; i < numLuciernagas; i++) {
    enjambre.add(new Luciernaga(random(10, width-10), random(10, height-10)));
  }
}
void draw() {
  if (estela) {
    fill(0, 0, 0, 10);//Opacidad
    rect(0, 0, width, height);
  } else {
    background(220, 20, 5);
  }
  for (int i = 0; i < enjambre.size(); i++) {
    Luciernaga l = enjambre.get(i);
    l.actualizar();
    l.dibujar();
  }
}

void mousePressed() {
  for (int i = 0; i < 10; i++) {
    enjambre.add(new Luciernaga(mouseX, mouseY));
  }
}
