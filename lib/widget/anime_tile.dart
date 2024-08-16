import 'package:anime_world_tutorial/Screen/anime_details.dart';
import 'package:anime_world_tutorial/models/anime_node.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeTile extends StatelessWidget {
  const AnimeTile({super.key, required this.anime});

  final AnimeNode anime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AnimeDetail(
                      id: anime.id
                      )
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: anime.mainPicture.medium,
                 fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
                
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              anime.title, 
              style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
            ),),
      ],
      ),

    );
  }
}