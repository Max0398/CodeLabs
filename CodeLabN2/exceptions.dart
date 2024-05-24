// Alias para una función que no devuelve nada
typedef VoidFunction = void Function();

// Clase para excepciones con mensajes
class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Interfaz para registrar eventos y excepciones
abstract class Logger {
  void logException(Type t, [String? msg]); // Registra una excepción
  void doneLogging(); // Indica que el registro ha finalizado
}

// Función para ejecutar una función potencialmente no confiable y manejar excepciones
void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy(); // Intenta ejecutar la función
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message); // Registra excepción con mensaje
  } on Exception {
    logger.logException(Exception); // Registra cualquier otra excepción
  } finally {
    logger.doneLogging(); // Indica que el registro ha finalizado
  }
}

// Implementación simple de un registro personalizado
class MyLogger extends Logger {
  Type? lastType; // Último tipo de excepción registrado
  String lastMessage = ''; // Último mensaje de excepción registrado
  bool done = false; // Indica si el registro ha finalizado

  void logException(Type t, [String? message]) {
    lastType = t;
    lastMessage = message ?? lastMessage; // Actualiza el mensaje si se proporciona uno nuevo
  }

  void doneLogging() => done = true; // Indica que el registro ha finalizado
}

void main() {
  final errs = <String>[];
  var logger = MyLogger();

  try {
    tryFunction(() => throw Exception(), logger);

    if ('${logger.lastType}' != 'Exception' &&
        '${logger.lastType}' != '_Exception') {
      errs.add(
          'Untrustworthy threw an Exception, but a different type was logged: \n ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add(
          'Untrustworthy threw an Exception with no message, but a message \n was logged anyway: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy threw an Exception, \n and doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    print(
        'Untrustworthy threw an exception, and an exception of type \n ${e.runtimeType} was unhandled by tryFunction.');
  }

  logger = MyLogger();

  try {
    tryFunction(() => throw ExceptionWithMessage('Hey!'), logger);

    if (logger.lastType != ExceptionWithMessage) {
      errs.add(
          'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different type was logged: ${logger.lastType}.');
    }

    if (logger.lastMessage != 'Hey!') {
      errs.add(
          'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different message was logged: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    print(
        'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and an exception of type ${e.runtimeType} was unhandled by tryFunction.');
  }

  logger = MyLogger();
  bool caughtStringException = false;

  try {
    tryFunction(() => throw 'A String', logger);
  } on String {
    caughtStringException = true;
  }

  if (!caughtStringException) {
    errs.add(
        'Untrustworthy threw a string, and it was incorrectly handled inside tryFunction().');
  }

  logger = MyLogger();

  try {
    tryFunction(() {}, logger);

    if (logger.lastType != null) {
      errs.add(
          'Untrustworthy didn\'t throw an Exception, \n but one was logged anyway: ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add(
          'Untrustworthy didn\'t throw an Exception with no message, \n but a message was logged anyway: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add(
          'Untrustworthy didn\'t throw an Exception, \n but doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    print(
        'Untrustworthy didn\'t throw an exception, \n but an exception of type ${e.runtimeType} was unhandled by tryFunction anyway.');
  }

  if (errs.isEmpty) {
    print('Success!');
  } else {
    errs.forEach(print);
  }
}
