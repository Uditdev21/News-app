import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_list_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const NewsListView()); // ✅ Navigate after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // ✅ Change to match your theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/news_logo.png", width: 150), // ✅ Add a logo
            const SizedBox(height: 20),
            const CircularProgressIndicator(
                color: Colors.white), // ✅ Loading indicator
          ],
        ),
      ),
    );
  }
}
