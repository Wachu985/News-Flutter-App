import 'package:dartz/dartz.dart';
import 'package:news_project/src/core/utils/params.dart';

import '../../../../core/error/failure.dart';
import '../entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<New>>> getNews(Params param);
}
