// presentation/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/webview_provider.dart';
import '../webview/webview_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Game Platform 1'),
            onTap: () {
              context
                  .read<WebViewProvider>()
                  .updateUrl('https://example.com/1');
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WebViewScreen()));
            },
          ),
          ListTile(
            title: Text('Game Platform 2'),
            onTap: () {
              context
                  .read<WebViewProvider>()
                  .updateUrl('https://example.com/2');
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WebViewScreen()));
            },
          ),
        ],
      ),
    );
  }
}
