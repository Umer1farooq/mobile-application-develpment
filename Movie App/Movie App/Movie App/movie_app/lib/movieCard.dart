 import 'package:flutter/material.dart';


class BuildMovieCard extends StatelessWidget {
  const BuildMovieCard({
    super.key,
    required this.movie,
  });

  final Map<String, String> movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              movie['image']!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie['title']!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
