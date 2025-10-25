import 'package:flutter/material.dart';
import 'package:movie_app/RMovieDetail.dart';
import 'package:movie_app/MovieDetail.dart';
import 'list.dart';
import 'movieCard.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Recommended Movies",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Rmovies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RMovieDetail(index: index),
                    ),
                  );
                },
              child: BuildMovieCard(movie: Rmovies[index]));
            },
          ),
        ),
      ],
    );
  }
}
