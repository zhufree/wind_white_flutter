import 'package:flutter/material.dart';
import 'article_item.dart';
class ArticlePage extends StatefulWidget {

  @override
  State createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final List<ArticleItem> _articles = <ArticleItem>[
    ArticleItem(new ArticleModel("title1", "content1")),
    ArticleItem(new ArticleModel("title2", "content2")),
    ArticleItem(new ArticleModel("title3", "content3")),
    ArticleItem(new ArticleModel("title4", "content4")),
    ArticleItem(new ArticleModel("title5", "content5")),
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, int index) => _articles[index],
      padding: new EdgeInsets.all(8.0),
      itemCount: _articles.length,
    );
  }
}

