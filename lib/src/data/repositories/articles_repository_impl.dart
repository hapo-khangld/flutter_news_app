import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_news_app/src/core/params/articles_request.dart';
import 'package:flutter_news_app/src/data/datasources/remote/news_api_service.dart';
import 'package:flutter_news_app/src/domain/repositories/articles_repository.dart';

import '../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;
  ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        category: params.category,
        country: params.country,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
