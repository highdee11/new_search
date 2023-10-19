
import 'package:newsapp/core/services/general_service.dart';

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? time;
  String? content;

  ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.time,
    this.content,
  });

  factory ArticleModel.fromJson(Map data){
    return ArticleModel(
        author: data['author'],
        title: data['title'],
        description: data['description'],
        url: data['url'],
        urlToImage: data['urlToImage'],
        publishedAt: data['publishedAt'],
        time: GeneralService.formatDate(data['publishedAt']),
        content: data['content'],
    );
  }

  @override
  String toString(){
    return '$title by $author';
  }
}