import 'package:anime_world_tutorial/common/styles/paddings.dart';
import 'package:anime_world_tutorial/models/anime.dart';
import 'package:anime_world_tutorial/widget/anime_tile.dart';
import 'package:flutter/material.dart';

class RankAnimeAll extends StatelessWidget {
  const RankAnimeAll({super.key, required this.animes});

final Iterable<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.defaultPadding,
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes.elementAt(index);
          return AnimeTile(
            anime: anime.node,
          );
        },
      ),
      );
  }
}