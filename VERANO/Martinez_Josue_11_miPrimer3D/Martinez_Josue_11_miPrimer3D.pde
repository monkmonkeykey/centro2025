PImage solTextura, tierraTextura, lunaTextura;
PShape solEsfera, tierraEsfera, lunaEsfera;
float radioSol = 50;
float radioTierra = 15;
float radioLuna = 5;

float radioOrbitaTierra = 450;
float radioOrbitaLuna = 150;

float anguloTranslacionTierra = 0;
float anguloTranslacionLuna = 0;
float anguloRotacionSol = 0;
float anguloRotacionTierra;
float anguloRotacionLuna;
float velocidad = 5;
float factorVelocidad = 0;

void setup() {
  fullScreen(P3D);
  //size(1280, 720, P3D);
  solTextura = loadImage("sol.png");
  tierraTextura = loadImage("tierra.png");
  lunaTextura = loadImage("luna.png");

  solEsfera = createShape(SPHERE, radioSol*2);
  tierraEsfera = createShape(SPHERE, radioTierra*2);
  lunaEsfera = createShape(SPHERE, radioLuna*2);

  solEsfera.setTexture(solTextura);
  tierraEsfera.setTexture(tierraTextura);
  lunaEsfera.setTexture(lunaTextura);

  solEsfera.setStrokeWeight(0);
  tierraEsfera.setStrokeWeight(0);
  lunaEsfera.setStrokeWeight(0);

  radioTierra = radioSol * 0.917;
  radioLuna = radioSol * 0.25;

  factorVelocidad = map(velocidad, 0, 100, 0, 1);
}

void draw() {
  background(0);
  //Sol
  pushMatrix();
  translate(width/2, height/2);
  rotateY(anguloRotacionSol);

  shape(solEsfera);
  pointLight(224, 210, 197, 0, 0, 0);
  pointLight(224, 210, 197, 0, 0, 0);
  popMatrix();

  float tierraX = width/2 + cos(radians(anguloTranslacionTierra)) * radioOrbitaTierra;
  float tierraY = height/2 + sin(radians(anguloTranslacionTierra)) * radioOrbitaTierra;
  println(tierraY);
  float lunaX = tierraX + cos(radians(anguloTranslacionLuna)) * radioOrbitaLuna;
  float lunaY = tierraY + sin(radians(anguloTranslacionLuna)) * radioOrbitaLuna;

  //Tierra
  pushMatrix();
  translate(tierraX, tierraY);
  rotateY(anguloRotacionTierra);
  shape(tierraEsfera);
  popMatrix();

  //Luna
  pushMatrix();
  translate(lunaX, lunaY);
  rotateX(anguloRotacionLuna);
  shape(lunaEsfera);
  popMatrix();



  anguloTranslacionTierra -= 13.53 * factorVelocidad;
  anguloTranslacionLuna -= 7.01 * factorVelocidad ;
  anguloRotacionLuna -= 1.01 * factorVelocidad ;
  anguloRotacionSol -= 1 * factorVelocidad;
  anguloRotacionTierra -= 0.037;
}
