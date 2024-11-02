// domain/use_cases/get_urls.dart
import 'package:gaming_platform_webview/data/models/url_models.dart';

class GetUrls {
  List<UrlModel> call() {
    return [
      UrlModel(name: 'Game Platform 1', url: 'https://example.com/1'),
      UrlModel(name: 'Game Platform 2', url: 'https://example.com/2'),
    ];
  }
}
