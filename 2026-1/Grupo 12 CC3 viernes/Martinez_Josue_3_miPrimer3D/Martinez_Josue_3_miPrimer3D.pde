//Definimos imagenes que usaremos como texturas
PImage texturaSol, texturaLuna, texturaTierra;
//Definimos objetos que serán primitivas 3D
PShape objetoSol, objetoLuna, objetoTierra;

void setup() {
  //Definimos el canvas y el motor de renderizado para 3D
  size(1000, 800, P3D);
  //Cargamos las imagenes que usaremos como texturas
  texturaSol = loadImage("sol.png");
  texturaLuna = loadImage("luna.png");
  texturaTierra = loadImage("tierra.png");
  //Definimos que formas 3D usaremos y las dimensiones para ellas
  objetoSol = createShape(SPHERE, 100);
  objetoLuna = createShape(SPHERE, 100);
  objetoTierra = createShape(SPHERE, 100);
  //Aplicamos las texturas a nuestras formasx
  objetoSol.setTexture(texturaSol);
  objetoLuna.setTexture(texturaLuna);
  objetoTierra.setTexture(texturaTierra);
  //Definir el ancho de las línes de dibujado en 0
  objetoSol.setStrokeWeight(0);
  objetoLuna.setStrokeWeight(0);
  objetoTierra.setStrokeWeight(0);
}
//Dibuja 60 fps
void draw() {
  background(0);
  //1ra forma Sol
  pushMatrix(); //Definir donde queremos comenzar las transformaciones
  translate(width/2, height/2);
  rotateY(radians(frameCount));
 
  shape(objetoSol);
   pointLight(250, 250, 250, 0, 0, 0);
  popMatrix(); //Define donde queremos finalziar las transformaciones

  //2da forma Luna
  pushMatrix(); //Definir donde queremos comenzar las transformaciones
  translate(width/4, height/2);
  rotateY(radians(frameCount));
  shape(objetoLuna);
  popMatrix(); //Define donde queremos finalziar las transformaciones
  //3ra forma Tierra
  pushMatrix(); //Definir donde queremos comenzar las transformaciones
  translate(width/4*3, height/2);
  rotateY(radians(frameCount));
  shape(objetoTierra);
  popMatrix(); //Define donde queremos finalziar las transformaciones
}
