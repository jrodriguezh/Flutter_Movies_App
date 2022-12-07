import 'package:flutter/material.dart';
import 'package:flutter_movies_app/providers/movies_provider.dart';
import 'package:flutter_movies_app/search/search_delegate.dart';
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
            "Películas: Últimos Estrenos",
          ),
          actions: [
            IconButton(
              onPressed: (() {
                showSearch(context: context, delegate: MovieSearchDelegate());
              }),
              icon: const Icon(Icons.search_outlined),
            )
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
                    sliderTittle: "Populares: Peliculas",
                    onNextPage: () {
                      moviesProvider.getPopularMovies();
                    }),
                SizedBox(
                  height: 20,
                ),
                MovieSlider(
                    movies: moviesProvider.popularMovies,
                    sliderTittle: "Populares: Series",
                    onNextPage: () {
                      moviesProvider.getPopularMovies();
                    }),
                SizedBox(
                  height: 20,
                ),
                MovieSlider(
                    movies: moviesProvider.popularMovies,
                    sliderTittle: "Populares: Streaming",
                    onNextPage: () {
                      moviesProvider.getPopularMovies();
                    }),
              ]),
        ));
  }
}
