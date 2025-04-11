PShape forma3dUno, forma3dDos, forma3dTres;  //objetos entes más complejos.
PImage texturaUno, texturaDos, texturaTres; //.png, .jpg, .jpeg o .tiff

void setup() {
  size(1200, 700, P3D);
  forma3dUno = createShape(BOX, 150);
  forma3dDos = createShape(SPHERE, 100);
  forma3dTres = createShape(SPHERE, 100);
  //Cargamos las imagenes para texturas
  texturaUno = loadImage("0.jpg");
  texturaDos = loadImage("lentejuelas.jpg");
  texturaTres = loadImage("2.jpg");
  //Aplicamos texturas
  forma3dUno.setTexture(texturaUno);
  forma3dDos.setTexture(texturaDos);
  forma3dTres.setTexture(texturaTres);
  //Cambiamos el ancho de línea de los polígonos
  forma3dUno.setStrokeWeight(0);
  forma3dDos.setStrokeWeight(0);
  forma3dTres.setStrokeWeight(0);
}

void draw() {

  background(0);
  // Forma 1
  pushMatrix(); //Definir una especie de layer. A partir de aquí realices las transformaciones
  //directionalLight(250, 102, 126, -1, 0, 0);
  translate(width/2, height/2);
  rotateY(radians(frameCount%90));
  float escala = map(mouseX, 0, width, 0.5, 2);
  scale(escala); //1 = 100%
  shape(forma3dUno);
  popMatrix();//Finaliza aquí las transformaciones.
  // Forma 2
  pushMatrix(); //Definir una especie de layer. A partir de aquí realices las transformaciones
  //directionalLight(250, 102, 126, -1, 0, 0);
  translate(width/6, height/2);
  rotateY(radians(frameCount%360));
  scale(1); //1 = 100%
  shape(forma3dDos);
  popMatrix();//Finaliza aquí las transformaciones.
  // Forma 3
  pushMatrix(); //Definir una especie de layer. A partir de aquí realices las transformaciones
  //directionalLight(250, 102, 126, -1, 0, 0);
  translate(width/2 + width/3, height/2);
  rotateY(radians(map(mouseX, 0, width, 0, 360)));
  rotateX(radians(map(mouseY, 0, height, 0, 360)));
  scale(1); //1 = 100%
  shape(forma3dTres);
  popMatrix();//Finaliza aquí las transformaciones.

  /*
  background(0);
   fill(255);
   rect(20, 20, 40, 40);
   fill(127);
   pushMatrix(); //Definir una especie de layer. A partir de aquí realices las transformaciones
   translate(width/2, height/2);
   rotate(radians(frameCount%90));
   float escala = map(mouseX, 0, width, 0.5, 5);
   scale(escala); //1 = 100%
   rect(20, 20, 40, 40);
   popMatrix();//Finaliza aquí las transformaciones.
   */
}
