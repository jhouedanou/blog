import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import '../models/article.dart';

class RssService {
  static Future<List<Article>> fetchArticles() async {
    final response =
        await http.get(Uri.parse('https://www.houedanou.com/feed/'));
    if (response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      return feed.items?.map((item) => Article.fromRssItem(item)).toList() ??
          [];
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
