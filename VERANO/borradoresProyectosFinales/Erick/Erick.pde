import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput mic;
FFT fft;

float energiaGraves = 0;
float energiaMedios = 0;
float energiaAgudos = 0;

int numLineas = 150;
float t = 0;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 2048);  // Mayor resolución
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(0);
  fft.forward(mic.left);

  // Reiniciar acumuladores
  energiaGraves = 0;
  energiaMedios = 0;
  energiaAgudos = 0;

  int countGraves = 0;
  int countMedios = 0;
  int countAgudos = 0;

  // Recorremos las bandas
  for (int i = 0; i < fft.specSize(); i++) {
    float freq = fft.indexToFreq(i);
    float amp = fft.getBand(i);

    if (freq >= 20 && freq < 250) {
      energiaGraves += amp;
      countGraves++;
    } else if (freq >= 250 && freq < 2000) {
      energiaMedios += amp;
      countMedios++;
    } else if (freq >= 2000 && freq < 8000) {
      energiaAgudos += amp;
      countAgudos++;
    }
  }

  // Promediar
  energiaGraves /= max(1, countGraves);
  energiaMedios /= max(1, countMedios);
  energiaAgudos /= max(1, countAgudos);

  // Visualización
  translate(width / 2, height / 2);

  // Color del círculo según medios
  float hueColor = map(energiaMedios, 0, 20, 180, 360);
  fill(hueColor, 80, 100);

  // Tamaño del círculo según graves
  float diametro = map(energiaGraves, 0, 20, 100, 400);
  ellipse(0, 0, diametro, diametro);

  // Líneas radiales según agudos
  stroke(255);
  for (int i = 0; i < numLineas; i++) {
    float ang = TWO_PI / numLineas * i;
    float base = map(noise(t + i * 0.05), 0, 1, 50, 100);
    float extra = map(energiaAgudos, 0, 20, 0, 300);
    float r = base + extra;
    float x = cos(ang) * r;
    float y = sin(ang) * r;
    line(0, 0, x, y);
  }

  t += 0.01;
}
