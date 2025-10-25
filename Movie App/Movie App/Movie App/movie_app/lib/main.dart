import 'package:flutter/material.dart';

import 'bannerSection.dart';

import 'playedMovieSection.dart';
import 'recommendedMovies.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie App'),
          actions: const [Icon(Icons.person)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Banner section
                BannerSection(),

                const SizedBox(height: 16),

                // ✅ Last Played Movies section
                PlayedMovieSection(),

                const SizedBox(height: 16),

                // ✅ Trending Movies section
                RecommendedMovies(),
              ],
            ),
          ),
        ),

        // ✅ Bottom Navigation Bar
      
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          ],
        ),
      ),
    );
  }
}
