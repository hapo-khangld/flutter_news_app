import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/src/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {Key? key,
      required this.article,
      this.isRemovable = false,
      required this.onArticlePressed})
      : super(key: key);
  final Article article;
  final bool? isRemovable;
  final void Function(Article article) onArticlePressed;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
