import 'package:flutter_news_app/src/core/params/articles_request.dart';
import 'package:flutter_news_app/src/domain/entities/article.dart';

import '../../core/resources/data_state.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
