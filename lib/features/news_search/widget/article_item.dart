import 'package:flutter/material.dart';
import 'package:newsapp/features/news_search/models/article_model.dart';
import '../../../core/config/brand_config.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  const ArticleItem({Key? key,
    required this.article
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade50,
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Header
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle, color: BrandStyleConfig.primary,),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: Text(article.author ?? "Unknown user", style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                          fontWeight: FontWeight.w400,
                        )))
                  ],
                ),
              ),

              //Title and Body
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title ?? "",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text(article.description ?? "",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                          color: Colors.black54
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    )
                  ],
                ),
              ),

              //Footer
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(article.time ?? "", style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                      fontWeight: FontWeight.w400,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
