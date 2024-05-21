class Bicycle {
  int cadence=0;
  int _speed = 0;
  int gear=0;

  Bicycle(int cadence, int gear){
    this.cadence = cadence;
    this.gear = gear;
  }

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}