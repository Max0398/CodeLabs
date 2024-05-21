bool esListaVacia(Object objeto) {
  // Se verifica si el objeto es una instancia de la clase List.
  if (objeto is! List) {
    // Si no es una lista, se retorna false.
    return false;
  }

  // Si es una lista, se utiliza la propiedad isEmpty para verificar si está vacía.
  return objeto.isEmpty;
}

void main() {
  print(esListaVacia([])); // Salida: true
  print(esListaVacia(123)); // Salida: false
}