
import 'package:anime_world_tutorial/api/get_anime_details.dart';
import 'package:anime_world_tutorial/common/styles/text_styles.dart';
import 'package:anime_world_tutorial/models/anime_details.dart';
import 'package:anime_world_tutorial/models/picture.dart';
import 'package:anime_world_tutorial/view/similar_animeview.dart';
import 'package:anime_world_tutorial/widget/InfoText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetail extends StatelessWidget {
  const AnimeDetail({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeDetailsApi(id: id), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
         final anime = snapshot.data;
         return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnimeImage(imageUrl: anime!.mainPicture.large),
                _buildAnimeTitle(englishtitle: anime.title, name: anime.alternativeTitles.en),
                _buildAnimeInfo(anime: anime),
                _buildAnimeImages(pictures: anime.pictures),
                SizedBox(height: 30,),
                SimilarAnimesView(animes: anime.recommendations.map((animeRec) => animeRec.node).toList(), 
                                  label: "Rekomended Anime",),
                SimilarAnimesView(animes: anime.relatedAnime.map((animeRec) => animeRec.node).toList(), 
                                  label: "Related Anime",),
                      
              ],
            ),
          ),
         ); 
        }
        return Text("Error Hei");
      } ,);
  }

  Widget _buildAnimeImage({
    required String imageUrl,
  }){
    return Stack(children: [
      CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover, height: 400, width: double.infinity,),
      Positioned(
        top: 20,
        left: 10,
        child: Builder(builder:(context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        },)
        )
    ],);
  }

  Widget _buildAnimeTitle({
    required String englishtitle,
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$englishtitle ($name)",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

   Widget _buildAnimeInfo({
    required AnimeDetails anime,
  }) {
    String studios = anime.studios.map((studio) => studio.name).join(', ');
    String genres = anime.genres.map((genre) => genre.name).join(', ');
    String otherNames =
        anime.alternativeTitles.synonyms.map((title) => title).join(', ');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoText(label: 'Genres: ', info: genres),
          InfoText(label: 'Start date: ', info: anime.startDate),
          InfoText(label: 'End date: ', info: anime.endDate),
          InfoText(label: 'Episodes: ', info: anime.numEpisodes.toString()),
          InfoText(
            label: 'Average Episode Duration: ',
            info: anime.averageEpisodeDuration.toString(),
          ),
          InfoText(label: 'Status: ', info: anime.status),
          InfoText(label: 'Rating: ', info: anime.rating),
          InfoText(label: 'Studios: ', info: studios),
          InfoText(label: 'Other Names: ', info: otherNames),
          InfoText(label: 'English Name: ', info: anime.alternativeTitles.en),
          InfoText(label: 'Japanese Name: ', info: anime.alternativeTitles.ja),
        ],
      ),
    );
  }

  Widget _buildAnimeImages({
    required List<Picture> pictures,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Text(
              'Image Gallery',
              style: TextStyles.largeText,
              textAlign: TextAlign.start,
              ),
            ),
          GridView.builder(
            itemCount: pictures.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 9 / 16,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final image = pictures[index].medium;
              return SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).pushNamed(
                      //   NetworkImageView.routeName,
                      //   arguments: largeImage,
                      // );
                    },
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}