import 'package:flutter/material.dart';
import 'package:movie_app/RMovieDetail.dart';
import 'package:movie_app/MovieDetail.dart';
import 'movieCard.dart';
import 'list.dart'
;
class PlayedMovieSection extends StatelessWidget {
  const PlayedMovieSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Last Played Movies",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetail(index: index),
                    ),
                  );
                },
                child: BuildMovieCard(movie: movies[index]));
            },
          ),
        ),
      ],
    );
  }
}

