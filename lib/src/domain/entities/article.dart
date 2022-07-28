import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/domain/entities/source.dart';

class Article extends Equatable {
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        source,
        author,
        description,
        url,
        title,
        urlToImage,
        publishedAt,
        content,
      ];

  @override
  bool get stringify => true;
}
