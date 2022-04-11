import 'dart:convert';

import 'package:flutter_data_practice/models/news.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static String apiUri =
      'https://newsapi.org/v2/top-headlines?country=kr&apiKey=';
  static String apiKey = '5f813172b9cb4cd2a994f49ec5542c1f';

  Uri uri = Uri.parse(apiUri + apiKey);

  Future<List<News>> getNews() async {
    List<News> news = [];
    final response = await http.get(uri);
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode == 200) {
      news = jsonDecode(body)['articles'].map<News>((article) {
        return News.fromMap(article);
      }).toList();
    }

    return news;
  }
}
