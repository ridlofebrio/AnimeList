
import 'package:anime_world_tutorial/Screen/animeScreen.dart';
import 'package:anime_world_tutorial/Screen/anime_details.dart';
import 'package:anime_world_tutorial/widget/anime_tile.dart';
import 'package:flutter/material.dart';
import '/models/anime_node.dart';


class SimilarAnimesView extends StatelessWidget {
  const SimilarAnimesView({
    super.key,
    required this.animes,
    required this.label,
  });

  final List<AnimeNode> animes;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title part
        SizedBox(
          height: 50,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: animes!.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              final anime = animes.elementAt(index);

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AnimeDetail(
                        id: anime.id
                        )
                    ),
                  );
                },
                child: AnimeTile(
                  anime: anime,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}