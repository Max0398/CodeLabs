// Clase para representar un color con componentes rojo, verde y azul
class Color {
  int red; 
  int green; 
  int blue; 

  // Constructor para crear un color con los componentes proporcionados
  Color(this.red, this.green, this.blue);

  // Constructor con nombre para crear el color negro (todos los componentes son 0)
  Color.black()
      : red = 0, // Componente rojo es 0
        green = 0, // Componente verde es 0
        blue = 0; // Componente azul es 0
}


// Tests your solution (Don't edit!):
void main() {
  final errs = <String>[];

  try {
    final result = Color.black();

    if (result.red != 0) {
      errs.add(
          'Called Color.black() and got a Color with red equal to \n ${result.red} instead of the expected value (0).');
    }

    if (result.green != 0) {
      errs.add(
          'Called Color.black() and got a Color with green equal to \n ${result.green} instead of the expected value (0).');
    }

    if (result.blue != 0) {
      errs.add(
          'Called Color.black() and got a Color with blue equal to \n ${result.blue} instead of the expected value (0).');
    }
  } catch (e) {
    print(
        'Called Color.black() and got an exception of type \n ${e.runtimeType}.');
    return;
  }

  if (errs.isEmpty) {
    print('Success!');
  } else {
    errs.forEach(print);
  }
}
