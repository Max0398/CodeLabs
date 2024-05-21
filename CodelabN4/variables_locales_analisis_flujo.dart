int fibonacciConTrazado(int n) {
  int resultado;

  // Caso base: Si n es menor que 2, el resultado es n.
  if (n < 2) {
    resultado = n;
  } else {
    // Recursión: Se calculan los dos valores de Fibonacci previos y se suman.
    int fibAnterior1 = fibonacciConTrazado(n - 2);
    int fibAnterior2 = fibonacciConTrazado(n - 1);
    resultado = fibAnterior1 + fibAnterior2;
  }

  // Se imprime el resultado y se retorna.
  print(resultado);
  return resultado;
}

void main() {
  print(fibonacciConTrazado(2));  // Salida: 5
}
