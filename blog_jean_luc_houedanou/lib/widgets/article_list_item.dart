import 'package:flutter/material.dart';
import '../models/article.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  ArticleListItem({required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: article.imageUrl != null
          ? Image.network(
              article.imageUrl!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            )
          : Icon(Icons.article),
      title: Text(
        article.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        article.content.replaceAll(RegExp(r'<[^>]*>'), ''),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
