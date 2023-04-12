import 'package:dartz/dartz.dart';
import 'package:news_project/src/core/utils/params.dart';
import 'package:news_project/src/features/news/domain/repository/news_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/news.dart';

class GetNews {
  const GetNews({required NewsRepository repository})
      : _repository = repository;
  final NewsRepository _repository;

  Future<Either<Failure, List<New>>> call({required Params param}) async =>
      await _repository.getNews(param);
}
