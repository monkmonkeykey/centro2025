String [] nombres = {"Ale", "Ethel", "Regina", "Fernanda"};//Definimos un array de tipo String
String [] apellidos = {"Espinosa", "Leyva", "Sánchez", "Alfaro"};
println(nombres[0], apellidos[0]);
//1ro | variable que vamos a iterar y su valor inicial
//2do | condición de repetición. Hasta que punto se hará
//3ro | Cómo aumentara el valor de la variable de iteración
// i++ aumenta el valor de i en 1 después de cada iteración
for (int i = 0; i < nombres.length; i++) {
  println(nombres[i], apellidos[i]);
}
