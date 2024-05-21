
class OtraClase {
  int enDeclaracion = 0;
  int conInicializadorFormal;
  int enListaInicializacion;

  OtraClase(this.conInicializadorFormal) : enListaInicializacion = 0;
}

void main() {
  var instancia = OtraClase(5);
  print(instancia.enDeclaracion);        // Salida: 0
  print(instancia.conInicializadorFormal); // Salida: 5
  print(instancia.enListaInicializacion);   // Salida: 0
}
