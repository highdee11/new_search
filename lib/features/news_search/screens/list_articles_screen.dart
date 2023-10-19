import 'package:flutter/material.dart';
import 'package:newsapp/core/config/brand_config.dart';
import 'package:newsapp/features/news_search/models/article_model.dart';
import 'package:newsapp/features/news_search/widget/article_item.dart';
import 'package:newsapp/widgets/app_bars/text_app_bar.dart';

class ListArticlesScreen extends StatefulWidget {
  final String query;
  final List<ArticleModel> data;

  const ListArticlesScreen({
    Key? key,
    required this.query,
    required this.data
  }) : super(key: key);

  @override
  State<ListArticlesScreen> createState() => _ListArticlesScreenState();
}

class _ListArticlesScreenState extends State<ListArticlesScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();

    articles.addAll(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(title: widget.query),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.separated(
          itemBuilder: (context, int index){
            ArticleModel article = articles[index];
            return ArticleItem(article: article);
          },
          separatorBuilder: (context, int index)=> const SizedBox(height: 15,),
          itemCount: articles.length
        ),
      ),
    );
  }
}
