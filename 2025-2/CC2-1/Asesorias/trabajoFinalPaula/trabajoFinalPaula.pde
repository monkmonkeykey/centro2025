int numFramesModelo = 3;
PImage [] modelo = new PImage [numFramesModelo];

void setup() {
  fullScreen();
  imageMode(CENTER);
  for (int i = 0; i <numFramesModelo; i++) {
    modelo[i] = loadImage("modelo"+ (i + 1) + ".png");
  }
  for (int i = 0; i <numFramesModelo; i++) {
    modelo[i].resize(modelo[i].width/3, modelo[i].height/3);
  }
  frameRate(30);
}

void draw() {

  if (frameCount%5 == 0) {
    
    background(170);
    image (modelo[frameCount%numFramesModelo], width/2, height/2);
  }
}
