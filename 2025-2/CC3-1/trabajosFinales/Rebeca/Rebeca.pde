PFont font;
String message = "Rebeca";
int fontSize = 400;
ArrayList<PVector> topPoints = new ArrayList<PVector>();
ArrayList<PVector> bottomPoints = new ArrayList<PVector>();

void setup() {
  size(800, 600);
  font = createFont("Roboto_Condensed-Regular.ttf", fontSize);
  textFont(font);
  textSize(fontSize);
  fill(0);
  noStroke();
  frameRate(1);
  PGraphics pg = createGraphics((int)textWidth(message), fontSize);
  pg.beginDraw();
  pg.background(255);
  pg.textFont(font);
  pg.textSize(fontSize);
  pg.fill(0);
  pg.textAlign(LEFT, CENTER);
  pg.text(message, 0, fontSize * 0.75);
  pg.endDraw();

  pg.loadPixels();

  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int loc = x + y * pg.width;
      float alpha = alpha(pg.pixels[loc]);
      if (alpha > 128) {
        if (y < pg.height / 2) {
          topPoints.add(new PVector(x, y));
        } else {
          bottomPoints.add(new PVector(x, y));
        }
      }
    }
  }
}

void draw() {
  background(255);
  translate((width - textWidth(message)) / 2, (height - fontSize) / 2);
  stroke(0, 100);
  noFill();

  for (int i = 0; i < min(topPoints.size(), bottomPoints.size()); i += 20) {
    PVector a = topPoints.get(i);
    PVector b = bottomPoints.get((i * 13) % bottomPoints.size());
    bezier(a.x, a.y,
      a.x, lerp(a.y, b.y, 0.3),
      b.x, lerp(a.y, b.y, 0.7),
      b.x, b.y);
  }
}
