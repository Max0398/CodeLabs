// Esta funcion resivira 2 strings  con parametros opcionales
void prepararSandwich(String tipoPan, [String? relleno]) {
  if (relleno != null) {
    print('Sandwich de $tipoPan con relleno de $relleno');
  } else {
    print('Sandwich de $tipoPan sin relleno');
  }
}
void main(){
     prepararSandwich('Integral'); // Salida: Sandwich de Integral sin relleno
  prepararSandwich('Integral', 'jamón'); // Salida: Sandwich de Integral con relleno de jamón
}