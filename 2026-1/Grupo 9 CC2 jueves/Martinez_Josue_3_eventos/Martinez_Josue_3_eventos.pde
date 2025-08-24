int posX, posY; //Inicializar las variables
int diametro = 30;
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
}
void draw() {
  posX = mouseX;
  posY = mouseY;
  //Si el botón del mouse es presionado y si este botón es el botón izquierdo
  if (mousePressed == true && mouseButton == LEFT) {
    ellipse(posX, posY, diametro, diametro);
  } else if (keyPressed == true && key == '+') {
    diametro = diametro + 1;
  } else if (keyPressed == true && key == '-') {
    diametro = diametro - 1;
  } else if (keyPressed == true && key == '1') {
    fill(#248FB4);
  } else if (keyPressed == true && key == '2') {
    fill(#56A23D);
  } else if (keyPressed == true && key == '3') {
    fill(#DBCC28);
  } else if (keyPressed == true && key == 'm') {
    int colorMapeo = int(map(mouseX, 0, width, 190, 270));
    fill(colorMapeo, 80, 80);
  } else if (key == 'r') {
    posX = posX + int(random(-20, 20));
    posY = posY + int(random(-20, 20));
    ellipse(posX, posY, diametro, diametro);
  } else if (key == 'c') {
    posX = posX + int(random(-20, 20));
    posY = posY + int(random(-20, 20));
    rect(posX, posY, diametro, diametro);
  }
}
