import 'package:dartz/dartz.dart';
import 'package:news_project/src/core/error/exception.dart';
import 'package:news_project/src/core/network/network.dart';
import 'package:news_project/src/features/news/data/datasource/local/new_local_datasource.dart';
import 'package:news_project/src/features/news/data/datasource/remote/new_remote_datasource.dart';
import 'package:news_project/src/features/news/data/models/new_model.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/params.dart';
import '../../domain/entities/news.dart';
import '../../domain/repository/news_repository.dart';

class NewRepositoryImpl extends NewsRepository {
  NewRepositoryImpl(
      {required NewLocalDatasource localDatasource,
      required NewRemoteDatasource remoteDatasource,
      required NetworkInfo network})
      : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource,
        _network = network;
  final NewLocalDatasource _localDatasource;
  final NewRemoteDatasource _remoteDatasource;
  final NetworkInfo _network;

  @override
  Future<Either<Failure, List<New>>> getNews(Params param) async {
    try {
      if (await _network.isConnected) {
        final results = await _remoteDatasource.getNews(param);
        _localDatasource.saveNew(results);
        List<New> listNew = [];
        for (var element in results) {
          listNew.add(element.toNew);
        }
        return Right(listNew);
      } else {
        final results = await _localDatasource.getNew();
        return Right(results);
      }
    } on ServerException {
      return const Left(NetworkFailure(message: "Error de Conexion"));
    } on CacheException {
      return const Left(CacheFailure(message: "Error de Cache"));
    }
  }
}
