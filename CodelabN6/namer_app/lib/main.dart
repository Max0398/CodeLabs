
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp()); // Inicia la aplicación Flutter.
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Proporciona un objeto de estado global a los widgets descendientes.
      create: (context) => MyAppState(), // Crea una instancia de MyAppState y la proporciona a los widgets descendientes.
      child: MaterialApp(
        title: 'Namer App', // Título de la aplicación.
        theme: ThemeData(
          useMaterial3: true, // Utiliza Material 3.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange), // Define el esquema de colores de la aplicación.
        ),
        home: MyHomePage(), // Página de inicio de la aplicación.
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // Palabra aleatoria actual asignada.

  void getNext() {
    current = WordPair.random(); // Obtiene la siguiente palabra aleatoria.
    notifyListeners(); // Notifica a los widgets que escuchan cambios en el estado.
  }

  var favorites = <WordPair>[]; // Lista de palabras favoritas.

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current); // Si la palabra actual está en favoritos, la elimina.
    } else {
      favorites.add(current); // Si la palabra actual no está en favoritos, la agrega.
    }
    notifyListeners(); // Notifica a los widgets que escuchan cambios en el estado.
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = Placeholder(); // Widget de marcador de posición inicial.
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(); // Página del generador de palabras.
        break;
      case 1:
        page = FavoritesPage(); // Página de palabras favoritas.
        break;
      default:
        throw UnimplementedError('No Widget for $selectedIndex'); // Error si no hay un widget definido para el índice seleccionado.
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600, // Muestra la barra de navegación extendida si el ancho es mayor o igual a 600.
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home), // Icono de la página de inicio.
                      label: Text('Home'), // Etiqueta de la página de inicio.
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite), // Icono de la página de favoritos.
                      label: Text('Favorites'), // Etiqueta de la página de favoritos.
                    ),
                  ],
                  selectedIndex: selectedIndex, // Índice de la página seleccionada.
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value; // Actualiza el índice de la página seleccionada.
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer, // Color de fondo del contenedor principal.
                  child: page, // Contenido de la página seleccionada.
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Obtiene el estado global de la aplicación.

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'), // Mensaje si no hay palabras favoritas.
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites:'), // Mensaje con el número de palabras favoritas.
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite), // Icono de favorito para cada palabra favorita.
            title: Text(pair.asLowerCase), // Texto de la palabra favorita.
          ),
      ],
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Obtiene el estado global de la aplicación.
    var pair = appState.current; // Palabra actual.

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite; // Icono de favorito si la palabra actual está en favoritos.
    } else {
      icon = Icons.favorite_border; // Icono de favorito sin rellenar si la palabra actual no está en favoritos.
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair), // Tarjeta grande con la palabra actual.
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(); // Botón para marcar/desmarcar la palabra como favorita.
                },
                icon: Icon(icon), // Icono de favorito o icono de favorito sin rellenar.
                label: Text('Like'), // Etiqueta del botón.
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext(); // Botón para obtener la siguiente palabra.
                },
                child: Text('Next'), // Texto del botón.
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // Cambia el color del texto.
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // Color del texto.
    );

    return Card(
      color: theme.colorScheme.primary, // Color de fondo de la tarjeta.
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase, // Texto de la palabra en minúsculas.
          style: style, // Estilo del texto.
          semanticsLabel: pair.asPascalCase, // Etiqueta semántica de la palabra en PascalCase.
        ),
      ),
    );
  }
}
