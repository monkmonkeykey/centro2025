PImage texturaSol, texturaLuna, texturaTierra;
PShape formaSol, formaLuna, formaTierra;

void setup() {
  fullScreen(P3D, 0);

  texturaSol = loadImage("agua.jpeg");//Cargamos las imagenes
  texturaLuna = loadImage("papelArrugado.jpg");
  texturaTierra = loadImage("piñata.jpeg");
  //Creamos y definimos la forma y la dimensión de nuetras 3D
  formaSol = createShape(SPHERE, 100);
  formaLuna = createShape(SPHERE, 100);
  formaTierra = createShape(SPHERE, 100);
  //Aplicar las texturas
  formaSol.setTexture(texturaSol);
  formaLuna.setTexture(texturaLuna);
  formaTierra.setTexture(texturaTierra);
  //Definir el ancho de la línea en 0
  formaSol.setStrokeWeight(0);
  formaLuna.setStrokeWeight(0);
  formaTierra.setStrokeWeight(0);
}

void draw() {
  background(0);
  //1ra capa de transformaciones
  pushMatrix();
  translate(width/2, height/2);
  rotateY(radians(frameCount*0.35%360));
  shape(formaSol);
  //pointLight(100, 100, 100, 0, 0, 0);
  popMatrix();

  //2da capa de transformaciones
  pushMatrix();
  translate(width/4, height/2);
  rotateY(radians(frameCount%360));
  //pointLight(70, 70, 70, 0, 0, 0);
  shape(formaLuna);
  popMatrix();

  //3ra capa de transformaciones
  pushMatrix();
  translate(width/4*3, height/2);
  rotateY(radians(frameCount*-0.5%360));
  shape(formaTierra);
  popMatrix();
}
