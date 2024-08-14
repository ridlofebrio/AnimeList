import 'package:anime_world_tutorial/view/featured_anime.dart';
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
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SizedBox(
                height: 300,
                child: FeaturedAnime(
                  label: "Top Anime",
                  rankingType: "all",
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SizedBox(
                height: 300,
                child: FeaturedAnime(
                  label: "Top Movie",
                  rankingType: "movie",
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SizedBox(
                height: 300,
                child: FeaturedAnime(
                  label: "Top Popular",
                  rankingType: "bypopularity",
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SizedBox(
                height: 300,
                child: FeaturedAnime(
                  label: "Top TV Series",
                  rankingType: "tv",
                ),
              ),
            )
          

          ],
          )
      ),
    );
  }
}