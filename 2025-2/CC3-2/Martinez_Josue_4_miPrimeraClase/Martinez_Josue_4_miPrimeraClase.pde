Elipse elipseUno; //Definiendo a un dato Elipse que se llamará elipseUno
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  elipseUno = new Elipse(width/2, height/2, 10); //Definimos las características de la elipseUno
}

void draw() {
  background(50);
  elipseUno.dibujar();
  elipseUno.vibrar();
 
}
