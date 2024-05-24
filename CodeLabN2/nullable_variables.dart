void main(){
   //parte 2
  String? name = 'Jane'; // Variable 'name' que contiene el nombre 'Jane' o podria ser nula
String? address; // Variable 'address' que puede contener una dirección o ser nula

  try {
    if (name == 'Jane' && address == null) {
      // verify that "name" is nullable
      name = null;
      print('Success!');
    } else {
      print('Not quite right, try again!');
    }
  } catch (e) {
    print('Exception: ${e.runtimeType}');
  }
}
