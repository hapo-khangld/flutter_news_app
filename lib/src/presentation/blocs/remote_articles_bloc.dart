import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/domain/usecase/get_articles_usecase.dart';

import '../../domain/entities/article.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(RemoteArticlesLoading(
            articles: const [], noMoreData: false, error: null));

  final GetArticlesUseCase _getArticlesUseCase;
  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  // Stream<RemoteArticlesState> mapEventToState(RemoteArticlesEvent event) async* {
  //   if (event is GetArticles) yield*
  // }
}
