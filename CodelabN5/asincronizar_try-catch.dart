// Esta función asincrónica intenta cambiar el nombre de usuario.
// Retorna un Future<String> que eventualmente contendrá el nuevo nombre de usuario o un mensaje de error.
Future<String> changeUsername() async {
  try {
    // Intenta obtener el nuevo nombre de usuario utilizando la función fetchNewUsername.
    return await fetchNewUsername();
  } catch (err) {
    // Si hay un error, devuelve el mensaje de error como una cadena.
    return err.toString();
  }
}

// Esta función asincrónica simula una llamada de red para obtener un nuevo nombre de usuario.
// Retorna un Future<String> que eventualmente contendrá el nuevo nombre de usuario.
Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), () => throw UserError());

// Clase que representa un error personalizado para indicar que el nuevo nombre de usuario es inválido.
class UserError implements Exception {
  @override
  String toString() => 'New username is invalid';
}


void main() async {
  final List<String> messages = [];
  const typoMessage = 'Test failed! Check for typos in your return value';

  print('Testing...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncDidCatchException(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                'Did you remember to call fetchNewUsername within a try/catch block?',
          }))
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncErrorEquals(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                'Did you remember to call fetchNewUsername within a try/catch block?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('Success. All tests passed!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Tried to run solution, but received an exception: $e');
  }
}

// Test helpers.
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    final readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

Future<String> _asyncErrorEquals(Function fn) async {
  final result = await fn();
  if (result == UserError().toString()) {
    return _passed;
  } else {
    return 'Test failed! Did you stringify and return the caught error?';
  }
}
// Esta función asincrónica intenta ejecutar la función `fn` y capturar cualquier excepción del tipo UserError.
// Retorna un Future<String> que será '_passed' si la excepción no fue capturada y '_noCatch' si fue capturada.
Future<String> _asyncDidCatchException(Function fn) async {
  var caught = true;
  try {
    await fn();
  } on UserError catch (_) {
    caught = false;
  }

  // Si la excepción no fue capturada, retorna '_noCatch', de lo contrario, retorna '_passed'.
  if (caught == false) {
    return _noCatch;
  } else {
    return _passed;
  }
}

// Constante que representa un estado de éxito.
const _passed = 'PASSED';

// Constante que representa un estado donde no se capturó ninguna excepción.
const _noCatch = 'NO_CATCH';
