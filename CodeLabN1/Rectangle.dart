import 'Point.dart';

class Rectangle{
final Point origin;
  final int width;
  final int height;

  const Rectangle({
    this.origin = const Point(0, 0),
    this.width = 0,
    this.height = 0,
  });

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
  
}