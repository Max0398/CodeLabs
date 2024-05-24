class BigObject {
  int anInt = 0; // Entero inicializado en 0
  String aString = ''; // Cadena inicializada como vacía
  List<double> aList = []; // Lista de dobles inicializada como vacía
  bool _done = false; // Estado privado inicializado en falso

  // Método para marcar el objeto como completado
  void allDone() {
    _done = true;
  }
}

// Función que llena y retorna un objeto BigObject usando el operador de cascada
BigObject fillBigObject(BigObject obj) {
  return obj
    ..anInt = 1 // Actualiza anInt a 1
    ..aString = 'String!' // Actualiza aString
    ..aList.add(3) // Agrega 3 a la lista
    ..allDone(); // Llama al método allDone para marcar como completado
}


void main() {
  BigObject obj;
  try {
    obj = fillBigObject(BigObject());
  } catch (e) {
    print(
        'Caught an exception of type ${e.runtimeType} \n while running fillBigObject');
    return;
  }

  final errs = <String>[];

  if (obj.anInt != 1) {
    errs.add(
        'The value of anInt was ${obj.anInt} \n rather than the expected (1).');
  }

  if (obj.aString != 'String!') {
    errs.add(
        'The value of aString was \'${obj.aString}\' \n rather than the expected (\'String!\').');
  }

  if (obj.aList.length != 1) {
    errs.add(
        'The length of aList was ${obj.aList.length} \n rather than the expected value (1).');
  } else {
    if (obj.aList[0] != 3.0) {
      errs.add(
          'The value found in aList was ${obj.aList[0]} \n rather than the expected (3.0).');
    }
  }

  if (!obj._done) {
    errs.add('It looks like allDone() wasn\'t called.');
  }

  if (errs.isEmpty) {
    print('Success!');
  } else {
    errs.forEach(print);
  }
}
