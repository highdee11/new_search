import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/features/news_search/controller/search_controller.dart';
import 'package:newsapp/features/news_search/models/article_model.dart';

void main() {
  test('Test Get New Service', () async {
    final NewsController controller = NewsController();

    List<ArticleModel>? articles = await controller.getNews("apple");

    expect(articles.runtimeType, List<ArticleModel>);
  });
}