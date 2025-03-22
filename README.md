# Flutter News App with GetX (MVVM, API, Animations) 📱

A modern Flutter News App that fetches real-time news articles using NewsAPI, with MVVM architecture, GetX state management, WebView integration, and a beautiful UI with animations.

## ✅ Features:
- ✔️ Get live news using NewsAPI
- ✔️ Search for news by keywords
- ✔️ Swipe to delete news articles
- ✔️ Pull-to-refresh feature
- ✔️ Full article preview using WebView
- ✔️ Splash screen for a smooth start
- ✔️ Hero animation for seamless transitions
- ✔️ Error handling for missing images & API failures
- ✔️ GetX for state management & navigation

## 📸 Screenshots
- Splash Screen
- News List
- News Details
- WebView

## 🚀 Tech Stack
- **Flutter (Dart)** – Mobile framework
- **GetX** – State management & navigation
- **NewsAPI.org** – Fetches news data
- **HTTP** – API communication
- **WebView** – Opens full news articles
- **Shimmer** – Animated loading skeleton

## 📂 Project Structure
```
lib/
│── main.dart
│── api/
│   └── news_api.dart
│── models/
│   └── news_article.dart
│── views/
│   ├── splash_screen.dart
│   ├── news_list_view.dart
│   ├── news_detail_view.dart
│   ├── news_webview.dart
│   └── news_item.dart
│── controllers/
│   └── news_controller.dart
│── utils/
│   ├── shimmer_loader.dart
│   └── url_launcher_helper.dart
└── bindings/
    └── news_binding.dart
```

## 🛠 Setup & Installation

### 1️⃣ Clone the Repo
```sh
git clone https://github.com/your-username/flutter-news-app.git
cd flutter-news-app
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Add Your API Key
Create a `.env` file in the root folder.

Add your NewsAPI key:
```ini
NEWS_API_KEY=your_api_key_here
```

### 4️⃣ Run the App
```sh
flutter run
```

## 🔑 API Configuration
This app requires a NewsAPI key.
Get your free API key from [NewsAPI.org](https://newsapi.org).

## 📌 Features in Detail

### 🖥 1. Splash Screen
- Displays a logo and loading animation before loading news.

### 📰 2. Fetch & Display News
- Top headlines are loaded by default.
- Search news using the search bar.
- Uses Shimmer loading effect for smooth UX.

### 🗑 3. Swipe to Delete
- Swipe left to remove news articles.
- Undo delete with a snackbar button.

### 🌎 4. Open Full Articles
- Click "Read Full Article" to open in WebView.
- If WebView is not available, opens in a browser.

### 🔄 5. Pull-to-Refresh
- Swipe down to refresh the news list.

## 🛠 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  http: ^0.13.6
  shimmer: ^3.0.0
  cached_network_image: ^3.2.3
  webview_flutter: ^4.7.0
  url_launcher: ^6.2.1
  flutter_dotenv: ^5.1.0
```

## 📜 License
This project is open-source and available under the MIT License.

## 🤝 Contributing
🚀 Contributions are welcome!
Feel free to fork the repo, make changes, and create a pull request.

1. Fork the repo
2. Create a branch: `git checkout -b feature-branch`
3. Commit changes: `git commit -m "Added new feature"`
4. Push changes: `git push origin feature-branch`
5. Submit a PR

## 🌟 Support & Feedback
💙 If you like this project, leave a star ⭐ on GitHub!
📧 For any issues, open a GitHub issue or email: your-email@example.com

🚀 Enjoy your Flutter News App! 🎉

