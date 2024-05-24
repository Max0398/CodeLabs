class Bicycle {
  int cadence = 0; // Cadencia de pedaleo
  int _speed = 0; // Velocidad actual (privada)
  int gear = 0; // Marcha actual

  // Constructor que inicializa la cadencia y la marcha
  Bicycle(int cadence, int gear) {
    this.cadence = cadence;
    this.gear = gear;
  }

  // Getter para obtener la velocidad actual
  int get speed => _speed;

  // Método para aplicar freno y disminuir la velocidad
  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  // Método para aumentar la velocidad
  void speedUp(int increment) {
    _speed += increment;
  }

  // Sobrescribe el método toString para proporcionar una representación en cadena
  @override
  String toString() => 'Bicycle: $_speed mph';
}
