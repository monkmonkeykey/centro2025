PFont font;
String[] hexColors = {"#AEC6FF", "#FFC0CB", "#a08b8d", "#005e84", "#42a5e4", "#4ad3c8", "#02c287"};
color[] colors;

float single, indent, ttl, tt, ttp, ttpp, ttppp, tttl, center, ttt, inc, nearBottom, incp;

void setup() {
  float TAU = TWO_PI;
  single = 1; // simplificado
  float t = TAU;
  indent = t + t + t + single;
  ttl = TAU * TAU - TAU;
  tt = TAU * TAU;
  ttp = ttl + ttl;
  ttpp = ttl + ttl + ttl;
  ttppp = ttl + ttl + ttl + ttl;
  tttl = TAU * TAU * TAU - TAU;
  center = tttl - tt - single - single;
  ttt = TAU * TAU * TAU;
  inc = ttl / ttt;
  incp = inc + inc;
  nearBottom = ttt + ttpp + tt;

  int cs = (int)(center * 2);
  size(500, 500);
  background(#f4f1de);

  font = createFont("Arial", 48); // Cambia por la fuente que tengas
  textFont(font);

  // Convertir hex a color()
  colors = new color[hexColors.length];
  for (int i = 0; i < hexColors.length; i++) {
    colors[i] = unhexColor(hexColors[i]);
  }
}

void draw() {
  background(#f4f1de);
  noStroke();
  float TAU = TWO_PI;

  for (float r = ttppp; r > TAU; r -= single) {
    fill(colorMixer(r));
    beginShape();
    for (float a = 0; a < TAU; a += inc) {
      // Simulación de ruido 4D con combinación en 3D
      float n = noise(cos(a), sin(a), r * incp * incp + frameCount * inc * inc);
      float roff = n * (TAU + TAU + single);
      float x = center + cos(a) * (r + roff);
      float y = center + sin(a) * (r + roff);
      vertex(x, y);
    }
    endShape(CLOSE);
  }

  fill(ttpp);
  text("holaaa", indent, nearBottom);
}

color unhexColor(String hex) {
  return color(
    unhex(hex.substring(1, 3)),
    unhex(hex.substring(3, 5)),
    unhex(hex.substring(5, 7))
    );
}

color colorMixer(float r) {
  float timer = frameCount * inc * inc * incp;
  float c = noise(r * incp * incp + timer) * colors.length;
  int cc = floor(c);
  int ccc = (cc + 1) % colors.length;

  color ca = colors[cc];
  color cb = colors[ccc];
  float amt = c - cc;

  float r1 = red(ca);
  float g1 = green(ca);
  float b1 = blue(ca);
  float r2 = red(cb);
  float g2 = green(cb);
  float b2 = blue(cb);

  return color(lerp(r1, r2, amt), lerp(g1, g2, amt), lerp(b1, b2, amt));
}
