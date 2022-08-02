import 'package:dio/dio.dart';
import 'package:flutter_news_app/src/data/datasources/remote/news_api_service.dart';
import 'package:flutter_news_app/src/data/repositories/articles_repository_impl.dart';
import 'package:flutter_news_app/src/domain/repositories/articles_repository.dart';
import 'package:flutter_news_app/src/domain/usecase/get_articles_usecase.dart';
import 'package:flutter_news_app/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio client
  injector.registerSingleton<Dio>(Dio());

  //dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticlesRepository>(
      ArticlesRepositoryImpl(injector()));

  //useCase
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  //blocs
  injector.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(injector()));
}
