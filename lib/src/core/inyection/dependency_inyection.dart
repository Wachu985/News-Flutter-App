import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isar/isar.dart';
import 'package:news_project/src/features/news/data/datasource/local/isar_new_local_datasource.dart';
import 'package:news_project/src/features/news/data/datasource/local/new_local_datasource.dart';
import 'package:news_project/src/features/news/data/datasource/remote/dio_new_remote_datasource.dart';
import 'package:news_project/src/features/news/data/datasource/remote/new_remote_datasource.dart';

import '../../features/news/data/models/new_model.dart';
import '../../features/news/data/repositories/new_repository_impl.dart';
import '../../features/news/domain/repository/news_repository.dart';
import '../../features/news/domain/usecases/get_news.dart';
import '../../features/news/presentation/bloc/news_bloc.dart';
import '../network/network.dart';

class DependencyInyection {
  static final sl = GetIt.instance;

  static Future<void> init() async {
    // Bloc
    sl.registerFactory(() => NewsBloc(getNews: sl()));

    // UseCases
    sl.registerLazySingleton(() => GetNews(repository: sl()));

    // Repository
    sl.registerLazySingleton<NewsRepository>(() => NewRepositoryImpl(
        localDatasource: sl(), remoteDatasource: sl(), network: sl()));

    // Datasources
    sl.registerLazySingleton<NewRemoteDatasource>(() => DioNewRemoteDatasource(
        urlbase: 'https://newsapi.org/v2/everything', client: sl()));
    sl.registerLazySingleton<NewLocalDatasource>(
      () => IsarNewLocalDatasourse(isar: sl()),
    );

    // Core
    sl.registerLazySingleton<NetworkInfo>(
        () => NetwotkInfoImpl(connection: sl()));

    // External
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerSingletonAsync(() async => await Isar.open([NewModelSchema]));
  }
}
