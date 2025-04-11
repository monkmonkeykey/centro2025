color cieloNocturno = #062355;
color cieloAzul = #76E0EA;
color solIntenso = #F7E839;
color solAmaneciendo = #F77F39;
float posX, posY;
int diametro = 80;
void setup() {
  size(700, 700);
  posX = width/2;
  posY = height+diametro;
  noStroke();
}

void draw() {
  float graduacionCielo = map(posY, height/4, height+diametro, 1, 0);
  float graduacionSol = map(posY, height/4, height+diametro, 1, 0);

  color colorCieloActual = lerpColor(cieloNocturno, cieloAzul, graduacionCielo);
  color colorSolActual = lerpColor(solAmaneciendo, solIntenso, graduacionSol);

  background(colorCieloActual);
  fill(colorSolActual);
  ellipse(posX, posY, diametro, diametro);
  if (posY >= height/4) {
    posY --;
  }
}
