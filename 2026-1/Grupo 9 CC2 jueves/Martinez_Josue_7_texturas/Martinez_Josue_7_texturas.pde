PImage texturaSol, texturaLuna, texturaTierra;
PShape formaSol, formaLuna, formaTierra;

void setup() {
  //size(1500, 500, P3D); //Trabajaremos con renderizado en 3D
  fullScreen(P3D);//Vamos a pantalla completa y renderiza en 3D
  texturaSol = loadImage("sol.png");
  texturaLuna = loadImage("luna.png");
  texturaTierra = loadImage("tierra.png");
  formaSol = createShape(SPHERE, 150);
  formaLuna = createShape(SPHERE, 100);
  formaTierra = createShape(SPHERE, 150);
  //Aplicando texturas
  formaSol.setTexture(texturaSol);
  formaLuna.setTexture(texturaLuna);
  formaTierra.setTexture(texturaTierra);
  //Reducimos el ancho de la línea de dibujo
  formaSol.setStrokeWeight(0);
  formaLuna.setStrokeWeight(0);
  formaTierra.setStrokeWeight(0);
}

void draw() {
  background(0);
  //Forma 1 | Forma Sol
  pushMatrix();//Quiero comenzar a aplicar transformaciones
  translate(width/2, height/2);
  rotateY(radians(frameCount%360));
  shape(formaSol);
  pointLight(255, 242, 224, 0, 0, 0);
  popMatrix(); //Aquí termino de aplicar mis transformaciones

  //Forma 2 | Forma Luna
  pushMatrix();//Quiero comenzar a aplicar transformaciones
  translate(width/5, height/2);
  rotateY(radians(frameCount%360));
  shape(formaLuna);
  //pointLight(255, 192, 127, 0, 0, 0);
  popMatrix(); //Aquí termino de aplicar mis transformaciones

  //Forma 3 | Forma Tierra
  pushMatrix();//Quiero comenzar a aplicar transformaciones
  translate(width/2 + width/3, height/2);
  rotateY(radians(frameCount%360));
  shape(formaTierra);
  //pointLight(255, 192, 127, 0, 0, 0);
  popMatrix(); //Aquí termino de aplicar mis transformaciones
}
