import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import '../views/news_item.dart';
import '../utils/shimmer_loader.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find();
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("News App")),
      body: Column(
        children: [
          // 🔹 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search News...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          controller.fetchNews();
                          FocusScope.of(context).unfocus(); // ✅ Hide keyboard
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  controller.fetchNews();
                }
              },
              onSubmitted: (query) => controller.searchNews(query),
            ),
          ),

          // 🔹 News List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const ShimmerLoader();
              }
              if (controller.hasError.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 50),
                      const SizedBox(height: 10),
                      Text(controller.errorMessage.value,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => controller.fetchNews(),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }
              if (controller.newsList.isEmpty) {
                return const Center(
                    child: Text("No news found. Try another search.",
                        style: TextStyle(fontSize: 16)));
              }
              return RefreshIndicator(
                onRefresh: () async {
                  controller.fetchNews();
                },
                child: ListView.builder(
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    final article = controller.newsList[index];

                    return Dismissible(
                      key: UniqueKey(), // ✅ Prevents duplicate keys
                      direction:
                          DismissDirection.endToStart, // ✅ Swipe Left to Remove
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        final removedArticle = article;
                        controller.removeNewsArticle(index);

                        // ✅ Show Undo Snackbar
                        Get.snackbar(
                          "Deleted",
                          "News article removed.",
                          snackPosition: SnackPosition.BOTTOM,
                          mainButton: TextButton(
                            onPressed: () {
                              controller.restoreNewsArticle(
                                  index, removedArticle);
                            },
                            child: const Text("UNDO",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        );
                      },
                      child: NewsItem(article: article),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
