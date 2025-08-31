//DEfinimos variables para usar imagenes como textura
PImage texturaSol, texturaLuna, texturaTierra;
//Definimos variables para usar primitivas 3D
PShape objetoSol, objetoLuna, objetoTierra;

void setup() {
  //Usamos un motor de renderizado en 3D
  //fullScreen(P3D, 0);
  size(1300, 800, P3D);
  texturaSol = loadImage("sol.png");
  texturaLuna = loadImage("luna.png");
  texturaTierra = loadImage("tierra.png");
  //Creamos los objetos 3D definiendo la forma y las dimensiones en xyz
  objetoSol = createShape(SPHERE, 100);
  objetoLuna = createShape(SPHERE, 80);
  objetoTierra = createShape(SPHERE, 90);
  //Aplicamos la textura a nuestras formas
  objetoSol.setTexture(texturaSol);
  objetoLuna.setTexture(texturaLuna);
  objetoTierra.setTexture(texturaTierra);

  //Definimos el ancho de las líneas de dibujo en 0
  objetoSol.setStrokeWeight(0);
  objetoLuna.setStrokeWeight(0);
  objetoTierra.setStrokeWeight(0);
}

void draw() {
  background(0);
  //1er Forma | Sol
  pushMatrix(); //inician las transformaciones
  translate(width/2, height/2);//Transladamos nuestro origen al centro
  rotateY(radians(frameCount%360));
  shape(objetoSol);
  pointLight(255, 214, 170, 0, 0, 0);
  pointLight(255, 214, 170, 0, 0, 0);
  popMatrix(); //finalizan nuestras transformaciones

  //2da Forma | Luna
  pushMatrix(); //inician las transformaciones
  translate(width/4, height/2);//Transladamos nuestro origen al centro
  rotateY(radians(frameCount%360));
  shape(objetoLuna);
  popMatrix(); //finalizan nuestras transformaciones

  //3ra Forma | Tierra
  pushMatrix(); //inician las transformaciones
  translate(width/4*3, height/2);//Transladamos nuestro origen al centro
  rotateY(radians(frameCount%360));
  shape(objetoTierra);
  popMatrix(); //finalizan nuestras transformaciones
}
