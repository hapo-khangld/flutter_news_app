import 'package:flutter_news_app/src/core/params/articles_request.dart';
import 'package:flutter_news_app/src/core/usecase/usecase.dart';
import 'package:flutter_news_app/src/domain/entities/article.dart';
import 'package:flutter_news_app/src/domain/repositories/articles_repository.dart';

import '../../core/resources/data_state.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParams? params}) {
    return _articlesRepository.getBreakingNewsArticles(params!);
  }
}
