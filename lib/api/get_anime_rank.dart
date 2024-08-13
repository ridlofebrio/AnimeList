import 'dart:convert';
import 'dart:html';

import 'package:anime_world_tutorial/models/anime_node.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/config/app_config.dart';
import '/models/anime.dart';

Future<Iterable<Anime>> getAnimeRankApi(
  {
    required String rankingType,
    required int limit
  }
) async {
  final baseurl = 'https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit';

  final response = await http.get(
    Uri.parse(baseurl),
    headers: {
      'X-MAL-CLIENT-ID': clientId,
    },
  );
  
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> animeNodeList = data['data'];
    final animes = animeNodeList
        .where((animeNode) => animeNode['node']['main_picture'] != null)
        .map((node) {return Anime.fromJson(node);},
    );
    return animes;

  } else {
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}