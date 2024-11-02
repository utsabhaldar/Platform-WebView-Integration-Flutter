// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/webview_provider.dart';
import 'presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WebViewProvider()),
      ],
      child: MaterialApp(
        title: 'Gaming Platform WebView',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
