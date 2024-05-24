import 'dart:math';

// Clase abstracta 'Shape' con un constructor de fábrica para crear diferentes formas.
abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2); // Retorna un círculo con radio 2
    if (type == 'square') return Square(2); // Retorna un cuadrado con lado 2
    throw 'Can\'t create $type.'; // Lanza excepción si el tipo no es reconocido
  }

  num get area; // Propiedad abstracta para calcular el área
}

// Clase 'Circle' que implementa 'Shape' y representa un círculo
class Circle implements Shape {
  final num radius;
  Circle(this.radius);

  num get area => pi * pow(radius, 2); // Calcula el área del círculo
}

// Clase 'Square' que implementa 'Shape' y representa un cuadrado
class Square implements Shape {
  final num side;
  Square(this.side);

  num get area => pow(side, 2); // Calcula el área del cuadrado
}
