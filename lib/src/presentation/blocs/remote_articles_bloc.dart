import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app/src/core/bloc/bloc_with_state.dart';
import 'package:flutter_news_app/src/core/params/articles_request.dart';
import 'package:flutter_news_app/src/core/resources/data_state.dart';
import 'package:flutter_news_app/src/domain/usecase/get_articles_usecase.dart';

import '../../domain/entities/article.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase) : super(RemoteArticlesLoading());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  Stream<RemoteArticlesState> mapEventToState(
      RemoteArticlesEvent event) async* {
    if (event is GetArticles) {
      yield* _getBreakingNewsArticle(event);
    }
  }

  Stream<RemoteArticlesState> _getBreakingNewsArticle(
      RemoteArticlesEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getArticlesUseCase(
        params: ArticlesRequestParams(page: _page),
      );

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final articles = dataState.data;
        final noMoreData = articles!.length < _pageSize;
        _articles.addAll(articles);
        _page++;

        yield RemoteArticlesDone(articles: _articles, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteArticlesError(error: dataState.error!);
      }
    });
  }
}
