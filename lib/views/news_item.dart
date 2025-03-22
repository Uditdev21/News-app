import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'news_detail_view.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // ✅ Use a placeholder if the image URL is missing or empty
    String imageUrl =
        (article.urlToImage != null && article.urlToImage.isNotEmpty)
            ? article.urlToImage
            : "https://via.placeholder.com/150"; // ✅ Default Placeholder Image

    return ListTile(
      leading: Hero(
        tag: article.urlToImage ??
            article.title, // ✅ Fallback to title if URL is null
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 100,
            height: 100,
            color:
                Colors.grey[300], // ✅ Show grey box if the image fails to load
            child: const Center(
              child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
            ),
          ),
        ),
      ),
      title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Text(article.description,
          maxLines: 2, overflow: TextOverflow.ellipsis),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailView(article: article)),
        );
      },
    );
  }
}
