Elipse e1; //Nuestro propio objeto creado y lo llamos e1


void setup() {
  size(800, 800);
  e1 = new Elipse();//Creamos a nuestro objeto
}

void draw() {
  //Llamamos a la funciones, acciones, métodos que creamos
  e1.dibujar();
  e1.vibrar();

}
