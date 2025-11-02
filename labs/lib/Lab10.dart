import 'package:flutter/material.dart';

void main() => runApp(MyScrollDemoApp());

class MyScrollDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrolling Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScrollDemoScreen(),
    );
  }
}

class ScrollDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // AppBar with scroll effect
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flutter Scrolling Demo"),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                    fit: BoxFit.cover,
                  ),
                  // Positioned example
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.black54,
                      child: Text(
                        "Positioned Widget",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ListView Example (using SliverList)
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: Icon(Icons.person),
                title: Text("ListTile Example 1"),
                subtitle: Text("Subtitle of list tile"),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("ListTile Example 2"),
                subtitle: Text("This is another list tile"),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "GridView Example ↓",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),

          // GridView Example (inside CustomScrollView)
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                color: Colors.blue[100 * ((index % 8) + 1)],
                child: Center(
                  child: Text(
                    'Grid Item $index',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }, childCount: 12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ),

          // End padding
          SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }
}
