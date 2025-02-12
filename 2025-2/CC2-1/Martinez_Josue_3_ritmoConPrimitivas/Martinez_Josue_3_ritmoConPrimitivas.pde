void setup() {
  //fullScreen();//Dibujar en el tamaño de nuestra pantalla completa
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);//canal alpha
}

/* Variables son espacio de memoria donde podemos guardar datos y
 las cuales tienen nombre */
// width | Obtiene el ancho de nuestro canvas
// height | Obtiene el alto de nuestro canvas
void draw() {
  background(50);
  noStroke();
  /*Aumentar el ritmo de el HUE o tono hasta 360 20 en 20  | Aumentar la posX en
   20 y ancho y alto en 10 y por último reduciendo la opacidad en 5. */
  fill(0, 80, 90, 100);
  ellipse(100, height/2, 20, 20);
  fill(20, 80, 90, 95);
  ellipse(130, height/2, 30, 30);
  fill(40, 80, 90, 90);
  ellipse(160, height/2, 40, 40);

  fill(60, 80, 90, 85);
  ellipse(180, height/2, 50, 50);
  fill(80, 80, 90, 80);
  ellipse(200, height/2, 60, 60);
  fill(100, 80, 90, 75);
  ellipse(220, height/2, 70, 70);

  fill(120, 80, 90, 70);
  ellipse(240, height/2, 80, 80);
  fill(140, 80, 90, 65);
  ellipse(260, height/2, 90, 90);
  fill(160, 80, 90, 60);
  ellipse(280, height/2, 100, 100);

  fill(180, 80, 90, 55);
  ellipse(300, height/2, 110, 110);
  fill(200, 80, 90, 50);
  ellipse(320, height/2, 120, 120);
  fill(220, 80, 90, 45);
  ellipse(340, height/2, 130, 130);

  fill(240, 80, 90, 40);
  ellipse(360, height/2, 140, 140);
  fill(260, 80, 90, 35);
  ellipse(380, height/2, 150, 150);
  fill(280, 80, 90, 30);
  ellipse(400, height/2, 160, 160);

  fill(300, 80, 90, 25);
  ellipse(420, height/2, 170, 170);
  fill(320, 80, 90, 20);
  ellipse(440, height/2, 180, 180);
  fill(340, 80, 90, 15);
  ellipse(460, height/2, 190, 190);

  fill(360, 80, 90, 10);
  ellipse(480, height/2, 200, 200);
}
