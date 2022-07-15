import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Peliculas en cines')),
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: const Icon(Icons.search_outlined),
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            // TODO: CardSwiper
            // Tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
            
            // Listado horizontal de películas
            MovieSlider(
              title: 'Populares!', // Opcional
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            MovieSlider(
              title: 'UpComing!', // Opcional
              movies: moviesProvider.upcomingMovies,
              onNextPage: () => moviesProvider.getUpcomingMovies(),
            ),
          ],
        ),
      )
    );
  }
}