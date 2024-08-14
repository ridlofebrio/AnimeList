import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/constants/app_colors.dart';
import '/models/anime.dart';

class TopAnimeSlider extends StatefulWidget {
  const TopAnimeSlider({
    super.key,
    required this.animes,
  });

  final Iterable<Anime> animes;

  @override
  State<TopAnimeSlider> createState() => _TopAnimeSliderState();
}

class _TopAnimeSliderState extends State<TopAnimeSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: widget.animes.length,
            itemBuilder: (context, index, realIndex) {
              final anime = widget.animes.elementAt(index);
              return TopAnimePicture(
                anime: anime,
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: widget.animes.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Color.fromARGB(255, 255, 190, 100),
            ),
          ),
        ],
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({super.key, required this.anime});

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(anime.node.mainPicture.medium),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
