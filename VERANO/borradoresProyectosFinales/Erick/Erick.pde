import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput mic;
FFT fft;

float energiaGraves = 0;
float energiaMedios = 0;
float energiaAgudos = 0;

void setup() {
  size(600, 400);
  minim = new Minim(this);
  mic = minim.getLineIn(Minim.MONO, 2048);  // Mayor resolución con 2048 samples
  fft = new FFT(mic.bufferSize(), mic.sampleRate());
}

void draw() {
  background(0);
  fft.forward(mic.left);  // análisis FFT del canal izquierdo

  // Reiniciar acumuladores
  energiaGraves = 0;
  energiaMedios = 0;
  energiaAgudos = 0;
  
  int countGraves = 0;
  int countMedios = 0;
  int countAgudos = 0;

  // Recorremos todas las bandas
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

  // Promediar la energía en cada rango
  energiaGraves /= max(1, countGraves);
  energiaMedios /= max(1, countMedios);
  energiaAgudos /= max(1, countAgudos);

  // Dibujar barras
  noStroke();
  
  // Graves
  fill(map(energiaGraves, 0, 10, 50, 255), 0, 0);
  rect(50, height - energiaGraves * 10, 100, energiaGraves * 10);
  
  // Medios
  fill(0, map(energiaMedios, 0, 10, 50, 255), 0);
  rect(250, height - energiaMedios * 10, 100, energiaMedios * 10);
  
  // Agudos
  fill(0, 0, map(energiaAgudos, 0, 10, 50, 255));
  rect(450, height - energiaAgudos * 10, 100, energiaAgudos * 10);

  // Etiquetas
  fill(255);
  textAlign(CENTER);
  text("Graves", 100, height - 10);
  text("Medios", 300, height - 10);
  text("Agudos", 500, height - 10);
}
