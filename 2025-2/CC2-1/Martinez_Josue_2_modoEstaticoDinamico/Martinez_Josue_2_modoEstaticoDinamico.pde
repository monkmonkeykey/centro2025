//Iteración = Repetición = Bucle
//Comentarios nos permiten describir el código
//void setup | Se ejecuta una sola vez = Modo estatico
//Unidad básica en la imagen digital es px

/* Espacio en la memoria de la compu donde guardamos datos y podemos
 acceder a partir de su nombre.
 Por ejemplo: el ancho del canvas que puede ser obtenido su valor númerico
 a partir de la variable width.
 */

String nombre = "Josué";
void setup() {
  fullScreen(); //Me permite definir el canvas en todo el ancho y alto de mi pantalla
  //size(800, 500);
  colorMode(HSB, 360, 100, 100);
  noStroke(); //No se dibuja contorno
}
//void draw() | Se ejecuta o dibuja su contenido 60 veces por segundo
// width = ancho de mi canvas
// height = alto de mi canvas
void draw() {
  //background(0,0,0);
  //random(0,250); | Obtenemos un valor aleatorio entre 0 y 250
  fill(random(0, 360), 80, 90);
  //stroke(mouseY, 80, 90);
  ellipse(random(25, width-25), random(25, height-25), 50, 50); //SE DIBUJA UNA ELLIPSE EN EL CENTRO DE LA PANTALLA
}

//Ejecuta el código contenido en esa función si se presiona cualquier tecla.
void keyPressed() {
  saveFrame("Martinez_Josue_2_modoEstaticoDinamico.png");
}
