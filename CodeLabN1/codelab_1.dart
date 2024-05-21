import 'Bicycle.dart';
import 'CreateFactory.dart';
import 'Point.dart';
import 'Rectangle.dart';

String scream(int length) => "A${'a' * length}h!";

void main(List<String> arguments) {
  //Instancia de la clase Bicycle
  var bike = Bicycle(5, 2);
  print(bike);
  print('\n');
  //Instancia de la clase Rectangle
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
  print('\n');
  //Parte 3
  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);

  //parte 5 programacion funcional
  print('\n');
  final values = [1, 2, 3, 5, 10, 50];
  for (var length in values) {
    print(scream(length));
  }
  print('\n');
  //Conversion codigo imperativo a funcional
  values.map(scream).forEach(print);
  print('\n');
  //caracteristicas Iterables
   values.skip(1).take(3).map(scream).forEach(print);

}
