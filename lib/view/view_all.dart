import 'package:anime_world_tutorial/api/get_anime_rank.dart';
import 'package:anime_world_tutorial/core/screens/error_screen.dart';
import 'package:anime_world_tutorial/widget/ranked_anime_all.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key
  , required this.label
  , required this.rankingType
  });

  final rankingType;
  final label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: FutureBuilder(
        future: getAnimeRankApi(rankingType: rankingType, limit: 100) ,
        builder: (context, snapshot){
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
            return RankAnimeAll(
              animes: snapshot.data!,
            );
          }
          return ErrorScreen(error: snapshot.error.toString());
      
        } ,),
    ); 
  }
}