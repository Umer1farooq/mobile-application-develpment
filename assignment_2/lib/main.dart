import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/list_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const TravelGuideApp());
}

class TravelGuideApp extends StatefulWidget {
  const TravelGuideApp({super.key});

  @override
  State<TravelGuideApp> createState() => _TravelGuideAppState();
}

class _TravelGuideAppState extends State<TravelGuideApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ListScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TravelGuideApp',
      home: Scaffold(
        appBar: AppBar(title: const Text('Travel Guide')),
        body: SafeArea(child: _screens[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          ],
        ),
      ),
    );
  }
}
