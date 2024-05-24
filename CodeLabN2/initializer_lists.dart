// Clase para almacenar las dos primeras letras de una palabra
class FirstTwoLetters {
  final String letterOne; // Primera letra de la palabra
  final String letterTwo; // Segunda letra de la palabra

  // Constructor que toma una palabra y asigna sus dos primeras letras
  FirstTwoLetters(String word)
      : assert(word.length >= 2), // Verifica que la palabra tenga al menos dos letras
        letterOne = word[0], // Asigna la primera letra de la palabra
        letterTwo = word[1]; // Asigna la segunda letra de la palabra
}


// Tests your solution (Don't edit!):
void main() {
  final errs = <String>[];

  try {
    final result = FirstTwoLetters('My String');

    if (result.letterOne != 'M') {
      errs.add(
          'Called FirstTwoLetters(\'My String\') and got an object with \n letterOne equal to \'${result.letterOne}\' instead of the expected value (\'M\').');
    }

    if (result.letterTwo != 'y') {
      errs.add(
          'Called FirstTwoLetters(\'My String\') and got an object with \n letterTwo equal to \'${result.letterTwo}\' instead of the expected value (\'y\').');
    }
  } catch (e) {
    errs.add(
        'Called FirstTwoLetters(\'My String\') and got an exception \n of type ${e.runtimeType}.');
  }

  bool caughtException = false;

  try {
    FirstTwoLetters('');
  } catch (e) {
    caughtException = true;
  }

  if (!caughtException) {
    errs.add(
        'Called FirstTwoLetters(\'\') and didn\'t get an exception \n from the failed assertion.');
  }

  if (errs.isEmpty) {
    print('Success!');
  } else {
    errs.forEach(print);
  }
}
