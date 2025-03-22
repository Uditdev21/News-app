import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsApi {
  static String apiKey = dotenv.get('API_KEY');
  static const String baseUrl = "https://newsapi.org/v2/";

  // 🔹 Fetch News Based on Search Query
  static Future<List<NewsArticle>> fetchNews({String query = ""}) async {
    try {
      String endpoint = query.isEmpty
          ? "${baseUrl}top-headlines?country=us&apiKey=$apiKey" // Default News
          : "${baseUrl}everything?q=${Uri.encodeComponent(query)}&sortBy=publishedAt&apiKey=$apiKey"; // ✅ Encoded Query

      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["articles"] != null && data["articles"].isNotEmpty) {
          return (data["articles"] as List)
              .map((json) => NewsArticle.fromJson(json))
              .toList();
        } else {
          throw Exception("No articles found.");
        }
      } else {
        throw Exception("API Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}
