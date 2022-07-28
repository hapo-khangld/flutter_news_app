part of 'remote_articles_bloc.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;

  final DioError error;

  const RemoteArticlesState(
      {required this.articles, required this.noMoreData, required this.error});

  @override
  List<Object> get props => [articles, noMoreData, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading(
      {required super.articles,
      required super.noMoreData,
      required super.error});
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<Article> article, DioError error,
      {required bool noMoreData})
      : super(articles: article, noMoreData: noMoreData, error: error);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(List<Article> article, bool noMoreData,
      {required DioError error})
      : super(articles: article, noMoreData: noMoreData, error: error);
}
