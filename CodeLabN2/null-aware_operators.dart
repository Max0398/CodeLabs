String? foo = 'a string'; // Variable 'foo' que contiene una cadena
String? bar; // Variable 'bar' que puede contener una cadena o ser nula

String? baz = foo ?? bar; // Variable 'baz' que tomará el valor de 'foo' si no es nulo; de lo contrario, tomará el valor de 'bar'

void updateSomeVars() {
  // Si 'bar' es nulo, se le asigna el valor 'a string'
  bar ??= 'a string';
}

void main(){
   
  try {
    updateSomeVars();

    if (foo != 'a string') {
      print('Looks like foo somehow ended up with the wrong value.');
    } else if (bar != 'a string') {
      print('Looks like bar ended up with the wrong value.');
    } else if (baz != 'a string') {
      print('Looks like baz ended up with the wrong value.');
    } else {
      print('Success!');
    }
  } catch (e) {
    print('Exception: ${e.runtimeType}.');
  }

}