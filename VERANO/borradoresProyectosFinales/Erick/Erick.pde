import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput mic;
AudioPlayer player;
FFT fft;

String modo = "mic";

float suavizadoGraves = 0;
float suavizadoMedios = 0;
float hueColor;
int numLineas = 200;
float[] suavizadoAgudos = new float[numLineas];
String textoActual;
ArrayList<float[]> puntosGraves = new ArrayList<float[]>();  // [x, y, vx, vy, tamaño]

void setup() {
  fullScreen();
  //size(600, 600);
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 2048);
  player = minim.loadFile("0.mp3", 2048);
  fft = new FFT(2048, 44100);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(0);

  if (modo.equals("mic")) {
    fft.forward(mic.left);
  } else {
    fft.forward(player.left);
  }

  float energiaGraves = 0;
  float energiaMedios = 0;
  int countGraves = 0;
  int countMedios = 0;

  for (int i = 0; i < fft.specSize(); i++) {
    float freq = fft.indexToFreq(i);
    float amp = fft.getBand(i);

    if (freq >= 20 && freq < 250) {
      energiaGraves += amp;
      countGraves++;
    } else if (freq >= 250 && freq < 2000) {
      energiaMedios += amp;
      countMedios++;
    }
  }

  energiaGraves /= max(1, countGraves);
  energiaMedios /= max(1, countMedios);
  suavizadoGraves = lerp(suavizadoGraves, energiaGraves, 0.1);
  suavizadoMedios = lerp(suavizadoMedios, energiaMedios, 0.1);

  // Generar puntos con graves fuertes
  if (energiaGraves > 4) {
    for (int i = 0; i < 1; i++) {
      float angle = random(TWO_PI);
      float velocidad = map(energiaGraves, 0, 20, 0.5, 3);
      float vx = cos(angle) * velocidad;
      float vy = sin(angle) * velocidad;
      float tam = random(3, 8);
      puntosGraves.add(new float[]{0, 0, vx, vy, tam});
    }
  }

  translate(width/2, height/2);

  // Dibujar puntos graves
  // fill(0, 0, 100, 80);
  noStroke();
  for (int i = puntosGraves.size() - 1; i >= 0; i--) {
    float[] p = puntosGraves.get(i);
    p[0] += p[2];  // x += vx
    p[1] += p[3];  // y += vy
    noStroke();
    fill(hueColor, 100, 100, 80);
    ellipse(p[0], p[1], p[4], p[4]);

    if (dist(0, 0, p[0], p[1]) > max(width/2, height/2)) {
      puntosGraves.remove(i);
    }
  }

  // Círculo central según graves
  float diametro = map(suavizadoGraves, 0, 15, 100, height/4);//modificas el diametro de la elipse
  float diametroNuevo = constrain(diametro, 100, height/2);//modificas el diametro de la elipse
  hueColor = map(suavizadoMedios, 0, 15, 180, 360);//Rangos de color en circunferencia central
  fill(hueColor, 80, 100);
  ellipse(0, 0, diametroNuevo, diametroNuevo);

  // Líneas radiales por frecuencias agudas
  stroke(255);
  for (int i = 0; i < numLineas; i++) {
    float minFreq = 2000;
    float maxFreq = 20000;
    float freqStep = (maxFreq - minFreq) / float(numLineas);
    float freqTarget = minFreq + i * freqStep;
    int band = fft.freqToIndex(freqTarget);
    float amp = fft.getBand(band);

    suavizadoAgudos[i] = lerp(suavizadoAgudos[i], amp, 0.1);

    float len = map(suavizadoAgudos[i], 0, 5, 50, width/2);
    float lenNuevo = constrain(len, 50, width/2 - 5);
    float angulo = TWO_PI / numLineas * i;

    float x = cos(angulo) * lenNuevo;
    float y = sin(angulo) * lenNuevo;
    line(0, 0, x, y);
  }

  // Mostrar modo
  fill(255);
  textAlign(LEFT, TOP);

  if (modo == "mic") {
    textoActual = "Presiona ('a' para pasar al modo audio)";
  } else {
    textoActual = "Presiona ('m' para pasar al modo microfono)";
  }
  text(textoActual, -width/2 + 10, -height/2 + 10);
}

void keyPressed() {
  if (key == 'a') {
    modo = "audio";
    mic.close();
    if (!player.isPlaying()) {
      player.rewind();
      player.play();
    }
  } else if (key == 'm') {
    modo = "mic";
    player.pause();
    player.rewind();
    mic = minim.getLineIn(Minim.MONO, 2048);
  }
}
