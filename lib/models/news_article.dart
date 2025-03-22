class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json["title"] ?? "No Title",
      description: json["description"] ?? "No Description",
      url: json["url"] ?? "", // ✅ Ensure URL is a string, even if empty
      urlToImage: json["urlToImage"] ?? "",
      content: json["content"] ?? "No Content",
    );
  }
}
