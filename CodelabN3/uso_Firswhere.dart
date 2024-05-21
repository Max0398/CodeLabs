
String singleWhere(Iterable<String> items) {
  return items.singleWhere(
          (element) => element.startsWith('M') && element.contains('a'));
}
void main(){
  const items = [
    'Salad',
    'Popcorn',
    'Milk',
    'Toast',
    'Sugar',
    'Mozzarella',
    'Tomato',
    'Egg',
    'Water',
  ];

  try {
    final str = singleWhere(items);
    if (str == 'Mozzarella') {
      print('Success. All tests passed!');
    } else {
      print(
        'Tried calling singleWhere, but received $str instead of '
        'the expected value \'Mozzarella\'',
      );
    }
  } on StateError catch (stateError) {
    print(
      'Tried calling singleWhere, but received a StateError: ${stateError.message}. '
      'singleWhere will fail if 0 or many elements match the predicate.',
    );
  } on UnimplementedError {
    print(
      'Tried running `singleWhere`, but received an error. '
      'Did you implement the function?',
    );
  } catch (e) {
    print('Tried calling singleWhere, but received an exception: $e');
  }

}