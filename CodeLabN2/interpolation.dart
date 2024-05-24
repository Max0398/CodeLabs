//parte 1
String stringify(int x, int y) {
  return '$x $y';
}

void main(List<String> arguments) {
  assert(stringify(2, 3) == '2 3',
      "Your stringify method returned '${stringify(2, 3)}' instead of '2 3'");
  print('Success!');


}
