import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../providers/webview_provider.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition for Android if needed
    // This is necessary for `webview_flutter` versions >=4.0 on Android
    if (WebView.platform == null) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WebViewProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Platform"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (await _controller.canGoBack()) {
              _controller.goBack();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: provider.currentUrl,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onPageStarted: (_) => provider.setLoading(true),
            onPageFinished: (_) => provider.setLoading(false),
            onWebResourceError: (error) {
              provider.setLoading(false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Failed to load page")),
              );
            },
            gestureNavigationEnabled: true,
          ),
          if (provider.isLoading) const LinearProgressIndicator(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.reload(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
