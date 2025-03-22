import 'package:get/get.dart';
import '../api/news_api.dart';
import '../models/news_article.dart';

class NewsController extends GetxController {
  var newsList = <NewsArticle>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  // 🔹 Fetch News (Default or Query-Based)
  void fetchNews({String query = ""}) async {
    try {
      isLoading(true);
      hasError(false);

      var articles = await NewsApi.fetchNews(query: query);
      newsList.assignAll(articles);
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // 🔹 Search News with API Call
  void searchNews(String query) {
    if (query.isEmpty) {
      fetchNews();
    } else {
      fetchNews(query: query);
    }
  }

  // 🔹 Remove News Article
  void removeNewsArticle(int index) {
    newsList.removeAt(index);
  }

  // 🔹 Restore Deleted Article (Undo)
  void restoreNewsArticle(int index, NewsArticle article) {
    newsList.insert(index, article);
  }
}
