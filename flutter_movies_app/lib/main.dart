import 'package:flutter/material.dart';
import 'package:flutter_movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas: Ultimos Estrenos',
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "details": (context) => const DetailsScreen(),
      },
      theme: ThemeData.dark()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.blueGrey[800])),
    );
  }
}
