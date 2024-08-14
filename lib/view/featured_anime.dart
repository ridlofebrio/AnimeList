import 'package:anime_world_tutorial/api/get_anime_rank.dart';
import 'package:anime_world_tutorial/core/screens/error_screen.dart';
import 'package:anime_world_tutorial/view/view_all.dart';
import 'package:anime_world_tutorial/widget/anime_tile.dart';
import 'package:flutter/material.dart';

class FeaturedAnime extends StatelessWidget {
  const FeaturedAnime({super.key, required this.label, required this.rankingType});

  final String rankingType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getAnimeRankApi(rankingType: rankingType, limit: 10), builder:(context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.data == null) {
        return const Center(
          child: Text("No data found"),
        );
      }
      if (snapshot.hasData) {
        final animes = snapshot.data;
        return Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAll(label: label, rankingType: rankingType)));
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final anime = animes.elementAt(index);
                  return AnimeTile(
                    anime: anime.node
                  );
              
                }, 
                separatorBuilder:(context, index){
                return const SizedBox(width: 10,);
              } , itemCount: animes!.length),
            )
          ],
        );
      }
      return ErrorScreen(error: snapshot.error.toString());

    });
  }
}