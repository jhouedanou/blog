class Article {
  final String title;
  final String content;
  final DateTime pubDate;
  final String? imageUrl;

  Article({
    required this.title,
    required this.content,
    required this.pubDate,
    this.imageUrl,
  });

  factory Article.fromRssItem(dynamic item) {
    return Article(
      title: item.title ?? '',
      content: item.description ?? '',
      pubDate: item.pubDate ?? DateTime.now(),
      imageUrl: item.enclosure?.url,
    );
  }
}
