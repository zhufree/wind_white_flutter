import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'article_item.g.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem(this.article);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  this.article.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                this.article.desc ?? "",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("by ${article.authorName}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

@JsonSerializable()
class Article {
  Article(this.title, this.content);

  String authorId;
  String authorName;
  String content;
  String createdAt;
  String desc;
  String objectId;
  String title;
  String updatedAt;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
