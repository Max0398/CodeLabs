// Función que toma una cadena opcional y devuelve su versión en mayúsculas o null si la cadena original es null
String? upperCaseIt(String? str) {
  return str?.toUpperCase(); // Si la cadena no es nula, la convierte a mayúsculas; de lo contrario, devuelve null
}


void main() {
  try {
    String? one = upperCaseIt(null);
    if (one != null) {
      print('Looks like you\'re not returning null for null inputs.');
    } else {
      print('Success when str is null!');
    }
  } catch (e) {
    print(
        'Tried calling upperCaseIt(null) and got an exception: \n ${e.runtimeType}.');
  }

  try {
    String? two = upperCaseIt('a string');
    if (two == null) {
      print('Looks like you\'re returning null even when str has a value.');
    } else if (two != 'A STRING') {
      print(
          'Tried upperCaseIt(\'a string\'), but didn\'t get \'A STRING\' in response.');
    } else {
      print('Success when str is not null!');
    }
  } catch (e) {
    print(
        'Tried calling upperCaseIt(\'a string\') and got an exception: \n ${e.runtimeType}.');
  }
}
