import 'package:anime_world_tutorial/api/get_anime_rank.dart';
import 'package:anime_world_tutorial/core/screens/error_screen.dart';
import 'package:anime_world_tutorial/widget/top_anime_slider.dart';
import 'package:flutter/material.dart';

class TopAnimeWidget extends StatelessWidget {
  const TopAnimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeRankApi(rankingType: 'all', limit: 5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } 
        if (snapshot.hasError) {
          return ErrorScreen(error: snapshot.error.toString());
        } 
        if (snapshot.hasData && snapshot.data != null) {
          // Asumsikan data yang diterima adalah daftar anime, Anda bisa meneruskannya ke TopAnimeSlider
          final animes = snapshot.data!.toList();
          return TopAnimeSlider(
            animes: animes,
          );  // Pastikan TopAnimeSlider menerima data dengan parameter 'animes'
        }
        // Jika tidak ada data yang diterima
        return const ErrorScreen(error: "No data available");
      },
    );
  }
}
