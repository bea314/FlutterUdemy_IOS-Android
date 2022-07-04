import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancia de movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movieTitle: movie.title, movieImageUrl: movie.fullBackdropPath),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(movie: movie),
                _Overview(overview: movie.overview),
                CastingCards(movieId: movie.id,),
              ]
            )
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final String movieTitle;
  final String movieImageUrl;

  const _CustomAppBar({Key? key, required this.movieTitle, required this.movieImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace:FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15,),
          alignment: Alignment.bottomCenter,
          child: Text(movieTitle, style: const TextStyle( fontSize: 16 ), textAlign: TextAlign.center,),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(movieImageUrl),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150
                ),
            ),
          ),
          const SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Row(
                children: [
                  const Icon(Icons.star, size: 20, color:  Colors.amber,),
                  const SizedBox(width: 5,),
                  Text(movie.voteAverage.toString(), style: textTheme.caption,),
                ],
              )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  
  final String overview;

  const _Overview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}
