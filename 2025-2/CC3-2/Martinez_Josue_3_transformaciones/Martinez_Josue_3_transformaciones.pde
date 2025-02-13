PImage mario;
float escala = 0.25;//Dato para escalar a nuestra imagen
int angulo = 0;
void setup() {
  size(500, 500);
  mario = loadImage("mario.png");
  imageMode(CENTER);//Definimos como dibujar la imagen

  rect(20, 20, 40, 40);
  pushMatrix();//Donde inician las tranformaciones
  translate(width/2, height/2);
  rect(0, 0, 40, 40);
  popMatrix(); //Donde finalizan las tranformaciones
  
}
/*
void draw() {
 background(50);
 pushMatrix();//Inicio de transformaciones
 translate(width/2, height/2);
 escala = map(frameCount%100, 0, 100, 0.25, 1);
 scale(escala); // 1 = 100%
 angulo = frameCount%360;
 rotate(radians(angulo));
 image(mario, 0, 0);//Dibujamos a mario
 popMatrix(); //Final de las transformaciones
 }
 */
