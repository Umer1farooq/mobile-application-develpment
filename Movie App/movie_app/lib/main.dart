import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> movies = [
    {'title': 'Prison Break', 'image': 'assets/prison-break.jpg'},
    {'title': 'Breaking Bad', 'image': 'assets/breaking1.jpg'},
    {'title': 'The Prison', 'image': 'assets/prison.jpg'},
    {'title': 'The Boys', 'image': 'assets/theboys.jpg'},
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),

                const SizedBox(height: 16),

                // ✅ Last Played Movies section
                const Text(
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
                      return _buildMovieCard(movies[index]);
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // ✅ Trending Movies section
                const Text(
                  "Trending Movies",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return _buildMovieCard(movies[index]);
                    },
                  ),
                ),
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  // ✅ Helper method for movie cards
  Widget _buildMovieCard(Map<String, String> movie) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
