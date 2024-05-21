void imprimirLongitudString(Object talVezString) {
  if (talVezString is String) {
    print('Longitud del string: ${talVezString.length}');
  } else {
    print('El valor proporcionado no es un string');
  }
}

void main() {
  Object valor1 = '¡Hola, Dart!';
  Object valor2 = 42;
  imprimirLongitudString(valor1); // Salida: Longitud del string: 12
  imprimirLongitudString(valor2); // Salida: El valor proporcionado no es un string
}
