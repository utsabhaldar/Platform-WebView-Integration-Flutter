// providers/webview_provider.dart
import 'package:flutter/material.dart';

class WebViewProvider extends ChangeNotifier {
  String? currentUrl;
  bool isLoading = true;

  void updateUrl(String url) {
    currentUrl = url;
    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
// /