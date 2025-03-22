import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_article.dart';

class NewsDetailView extends StatelessWidget {
  final NewsArticle article;
  const NewsDetailView({super.key, required this.article});

  // ✅ Open the URL in the system browser
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Use a placeholder if image URL is missing
    String imageUrl =
        (article.urlToImage != null && article.urlToImage.isNotEmpty)
            ? article.urlToImage
            : "https://via.placeholder.com/250";

    return Scaffold(
      appBar: AppBar(
        title:
            Text(article.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.urlToImage ?? article.title,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.content.isNotEmpty
                        ? article.content
                        : "Full article not available.",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  // ✅ Clickable URL
                  if (article.url.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _launchURL(article.url);
                        print("clicked");
                      }, // ✅ Open link in browser
                      child: const Text(
                        "Read full article here",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
