import 'package:flutter/material.dart';
import 'package:flutter_movies_app/providers/movies_provider.dart';
import 'package:flutter_movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Películas: Ultimos Estrenos",
          ),
          actions: [
            IconButton(
                onPressed: (() {}), icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(

              //Tarjetas Principales
              children: [
                CardSwiper(movies: moviesProvider.onDisplayMovies),

                //Slider Peliculas
                MovieSlider(
                    movies: moviesProvider.popularMovies,
                    sliderTittle: "Populares",
                    onNextPage: () {
                      moviesProvider.getPopularMovies();
                    }),
              ]),
        ));
  }
}
