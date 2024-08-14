import 'package:anime_world_tutorial/Screen/animeScreen.dart';
import 'package:anime_world_tutorial/models/anime.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.index});

  final int? index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    const NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final _screens = const [
    animeScreen(),
    Center(child: Text("Search Masih Proses")),
    Center(child: Text("Categories Masih Proses")),
    Center(child: Text("Settings Masih Proses")),
  ];

  late int _currentScreenIndex;

  @override
  void initState() {
    super.initState();
    // Inisialisasi _currentScreenIndex dengan widget.index, atau 0 jika widget.index null
    _currentScreenIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 8,
        backgroundColor: Color.fromARGB(255, 255, 197, 111),
        destinations: _destinations,
        selectedIndex: _currentScreenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}
