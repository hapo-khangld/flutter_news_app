part of 'remote_articles_bloc.dart';

@immutable
abstract class RemoteArticlesState extends Equatable {
  @override
  List<Object> get props => [];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  final List<Article> articles;
  final bool noMoreData;
  RemoteArticlesDone({
    required this.articles,
    required this.noMoreData,
  });

  @override
  List<Object> get props => [articles, noMoreData];
}

class RemoteArticlesError extends RemoteArticlesState {
  final DioError error;
  RemoteArticlesError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
