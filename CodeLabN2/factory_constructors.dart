// Clase base para almacenar enteros
class IntegerHolder {
  IntegerHolder(); // Constructor por defecto

  // Constructor de fábrica para crear instancias basadas en la longitud de la lista
  factory IntegerHolder.fromList(List<int> list) {
    if (list.length == 1) {
      return IntegerSingle(list[0]); // Devuelve una instancia de IntegerSingle
    } else if (list.length == 2) {
      return IntegerDouble(list[0], list[1]); // Devuelve una instancia de IntegerDouble
    } else if (list.length == 3) {
      return IntegerTriple(list[0], list[1], list[2]); // Devuelve una instancia de IntegerTriple
    } else {
      throw Error(); // Lanza un error si la lista no tiene una longitud válida
    }
  }
}

// Clase para almacenar un solo entero
class IntegerSingle extends IntegerHolder {
  final int a; // Entero único
  IntegerSingle(this.a); // Constructor que inicializa 'a'
}

// Clase para almacenar dos enteros
class IntegerDouble extends IntegerHolder {
  final int a; // Primer entero
  final int b; // Segundo entero
  IntegerDouble(this.a, this.b); // Constructor que inicializa 'a' y 'b'
}

// Clase para almacenar tres enteros
class IntegerTriple extends IntegerHolder {
  final int a; // Primer entero
  final int b; // Segundo entero
  final int c; // Tercer entero
  IntegerTriple(this.a, this.b, this.c); // Constructor que inicializa 'a', 'b' y 'c'
}

// Tests your solution (Don't edit!):
void main() {
  final errs = <String>[];

  bool _throwed = false;
  try {
    IntegerHolder.fromList([]);
  } on UnimplementedError {
    print('Test failed. Did you implement the method?');
    return;
  } on Error {
    _throwed = true;
  } catch (e) {
    print(
        'Called IntegerSingle.fromList([]) and got an exception of \n type ${e.runtimeType}.');
    return;
  }

  if (!_throwed) {
    errs.add('Called IntegerSingle.fromList([]) and didn\'t throw Error.');
  }

  try {
    final obj = IntegerHolder.fromList([1]);

    if (obj is! IntegerSingle) {
      errs.add(
          'Called IntegerHolder.fromList([1]) and got an object of type \n ${obj.runtimeType} instead of IntegerSingle.');
    } else {
      if (obj.a != 1) {
        errs.add(
            'Called IntegerHolder.fromList([1]) and got an IntegerSingle with \n  an \'a\' value of ${obj.a} instead of the expected (1).');
      }
    }
  } catch (e) {
    print(
        'Called IntegerHolder.fromList([]) and got an exception of \n type ${e.runtimeType}.');
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2]);

    if (obj is! IntegerDouble) {
      errs.add(
          'Called IntegerHolder.fromList([1, 2]) and got an object of type \n ${obj.runtimeType} instead of IntegerDouble.');
    } else {
      if (obj.a != 1) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble \n with an \'a\' value of ${obj.a} instead of the expected (1).');
      }

      if (obj.b != 2) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble \n with an \'b\' value of ${obj.b} instead of the expected (2).');
      }
    }
  } catch (e) {
    print(
        'Called IntegerHolder.fromList([1, 2]) and got an exception \n of type ${e.runtimeType}.');
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2, 3]);

    if (obj is! IntegerTriple) {
      errs.add(
          'Called IntegerHolder.fromList([1, 2, 3]) and got an object of type \n ${obj.runtimeType} instead of IntegerTriple.');
    } else {
      if (obj.a != 1) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.a} instead of the expected (1).');
      }

      if (obj.b != 2) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.b} instead of the expected (2).');
      }

      if (obj.c != 3) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.b} instead of the expected (2).');
      }
    }
  } catch (e) {
    print(
        'Called IntegerHolder.fromList([1, 2, 3]) and got an exception \n of type ${e.runtimeType}.');
    return;
  }

  if (errs.isEmpty) {
    print('Success!');
  } else {
    errs.forEach(print);
  }
}
