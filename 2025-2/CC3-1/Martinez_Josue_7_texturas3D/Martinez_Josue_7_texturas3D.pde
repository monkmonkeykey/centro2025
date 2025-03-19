PImage texturaUno, texturaDos, texturaTres; // Imagenes que usaremos como texturas.
PShape objUno, objDos, objTres;
float rotacionXUno = 0.2;
void setup() {
  size(900, 500, P3D);//Motor de renderizado
  //Cargar las imagenes que usaremos como texturas
  texturaUno = loadImage("0.jpg");
  texturaDos = loadImage("1.jpg");
  texturaTres = loadImage("2.jpg");
  //Crear a nuestras formas
  objUno = createShape(BOX, 100);
  objDos = createShape(SPHERE, 100);
  objTres = createShape(SPHERE, 100);
  //Aplicanmos las texturas a nuestras formas
  objUno.setTexture(texturaUno);
  objDos.setTexture(texturaDos);
  objTres.setTexture(texturaTres);
  //Definimos el ancho de línea en 0. Lo eliminamos.
  objUno.setStrokeWeight(0);
  objDos.setStrokeWeight(0);
  objTres.setStrokeWeight(0);
}

void draw() {
  background(0);
  rotacionXUno = rotacionXUno + 0.0075;
  //Forma Uno
  pushMatrix(); //Aquí comienzan las transformaciones.
  translate(width/2, height/2);
  rotateX(rotacionXUno%360);
  shape(objUno);
  popMatrix(); //Indicar donde finalizan las transformaciones.

  //Forma Dos
  pushMatrix(); //Aquí comienzan las transformaciones.
  translate(width/4, height/2);
  rotateX(rotacionXUno%360);
  shape(objDos);
  popMatrix(); //Indicar donde finalizan las transformaciones.

  //Forma Tres
  pushMatrix(); //Aquí comienzan las transformaciones.
  translate(width/4*3, height/2);
  float rotacionXTres, rotacionYTres;
  rotacionXTres = map(mouseX, 0, width, 0, 360);
  rotacionYTres = map(mouseY, 0, height, 0, 360);
  rotateY(radians(rotacionXTres));
  rotateX(radians(rotacionYTres));

  shape(objTres);
  popMatrix(); //Indicar donde finalizan las transformaciones.
}
