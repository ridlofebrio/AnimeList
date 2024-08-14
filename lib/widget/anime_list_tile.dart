import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/models/anime.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile({
    super.key,
    required this.anime,
    this.rank,
  });

  final Anime anime;
  final int? rank;

  @override
  Widget build(BuildContext context) {
 return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                SizedBox(
                  height: 100,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: anime.node.mainPicture.medium,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 20),

                // Anime Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (rank != null) AnimeRankBadge(rank: rank!),
                      const SizedBox(height: 10),
                      Text(
                        anime.node.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}

class AnimeRankBadge extends StatelessWidget {
  const AnimeRankBadge({
    super.key,
    required this.rank,
  });

  final int rank;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 3.0,
        ),
        child: Text(
          'Rank $rank',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}