import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;
  
  const MovieSlider({
    Key? key, 
    required this.movies, 
    required this.onNextPage,
    this.title, 
    }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.pixels - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ( this.widget.movies.length == 0 ) {
      return const SizedBox(
        width: double.infinity,
        height: 280,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(widget.title ?? '', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(movie: widget.movies[index], heroId: '${widget.title}-$index-${widget.movies[index].id}'),
            ),
          )
        ],
      )
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;
  final String heroId;
  
  const _MoviePoster({
    Key? key, 
    required this.movie, 
    required this.heroId,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  movie.heroId = heroId;

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: (() => Navigator.pushNamed(context, 'details', arguments: movie)),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
            const SizedBox( height: 5,),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}