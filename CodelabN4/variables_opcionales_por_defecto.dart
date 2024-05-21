// Usando seguridad de null:
void saludar(String nombre, [String titulo = 'Estimado']) {
  print('$titulo $nombre');
}

void main() {
  saludar('Juan');                // Salida: Estimado Juan
  saludar('Ana', 'Dra.');  // Salida: Dra. Ana
}
