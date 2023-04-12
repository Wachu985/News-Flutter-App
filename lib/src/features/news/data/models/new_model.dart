import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/news.dart';
import 'source_model.dart';

part 'new_model.g.dart';

@Collection(inheritance: false)
class NewModel extends Equatable {
  const NewModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Id id = Isar.autoIncrement;
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"] ?? 'Not Found',
        title: json["title"] ?? 'Not Found',
        description: json["description"] ?? 'Not Found',
        url: json["url"] ?? 'Not Found',
        urlToImage: json["urlToImage"] ?? 'Not Found',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };

  @override
  @ignore
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

extension NewModelExtension on NewModel {
  New get toNew => New(
      source: source.toSource,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content);
}
