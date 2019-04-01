import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem(this.article);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(this.article.title),
        Text(this.article.content)
      ],
    );
  }
}

class ArticleModel {
  ArticleModel(this.title, this.content);
  String title;
  String content;
}
