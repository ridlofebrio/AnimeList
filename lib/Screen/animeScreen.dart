import 'package:anime_world_tutorial/widget/top_anime.dart';
import 'package:flutter/material.dart';

class animeScreen extends StatefulWidget {
  const animeScreen({super.key});

  @override
  State<animeScreen> createState() => _animeScreenState();
}

class _animeScreenState extends State<animeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child : TopAnimeWidget(),
              height: 300,
            )
          ],
          )
      ),
    );
  }
}