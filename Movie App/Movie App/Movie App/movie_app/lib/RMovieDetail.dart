import 'package:flutter/material.dart';
import '/list.dart';

class RMovieDetail extends StatelessWidget {
  final int index;

  const RMovieDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Detail")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 350,
                child: Image.asset(
                  Rmovies[index]['image']!,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Rmovies[index]['title']!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        Rmovies[index]['description']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 40),
                            SizedBox(width: 20),
                            Icon(Icons.star, color: Colors.amber, size: 40),
                            SizedBox(width: 20),
                            Icon(Icons.star, color: Colors.amber, size: 40),
                            SizedBox(width: 20),
                            Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                              size: 40,
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                color: Color(0xFF2A2A2A),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.play_arrow, color: Colors.white, size: 30),
                            Text(
                              "Watch Movie",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
