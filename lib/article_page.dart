import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'article_item.dart';
import 'wind_constants.dart';
import 'private_constants.dart';

class ArticlePage extends StatefulWidget {
  @override
  State createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final List<ArticleItem> _articles = <ArticleItem>[];

  void getHttp() async {
    try {
      Response response =
          await Dio().get(Constants.baseUrl + Constants.articlePath,
              options: Options(headers: {
                "X-Bmob-Application-Id": PrivateConstants.APP_ID,
                "X-Bmob-REST-API-Key": PrivateConstants.API_KEY,
                "Content-Type": "application/json",
              },),queryParameters: {"order": "-createdAt"});
        for (var obj in response.data['results']) {
          var article = new Article.fromJson(obj);
          setState(() {
            _articles.add(ArticleItem(article));
          });
        }

    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, int index) => _articles[index],
      padding: new EdgeInsets.all(8.0),
      itemCount: _articles.length,
    );
  }
}
