
import 'package:newsapp/core/services/network/network_request.dart';
import 'package:newsapp/features/news_search/models/article_model.dart';

class NewsController {

  //Network request instance
  final NetworkRequest getNewsRequest = NetworkRequest(endpoint: "/everything");

  //Get news
  Future<List<ArticleModel>?> getNews(String params)async {
    await getNewsRequest.get(query: params);

    if(getNewsRequest.response != null){
      Map body = getNewsRequest.response!.data;
      List articles = body['articles'];
      return articles.map((e) => ArticleModel.fromJson(e)).toList();
    }

    return null;
  }

}