import 'package:dio/dio.dart';
import 'package:news_project/src/core/error/exception.dart';
import 'package:news_project/src/core/utils/params.dart';
import 'package:news_project/src/features/news/data/datasource/remote/new_remote_datasource.dart';
import 'package:news_project/src/features/news/data/models/new_model.dart';

import '../../../../../core/environment/environment_config.dart';

class DioNewRemoteDatasource extends NewRemoteDatasource {
  DioNewRemoteDatasource({
    required Dio client,
    required String urlbase,
  })  : _client = client,
        _urlBase = urlbase;
  final Dio _client;
  final String _urlBase;

  @override
  Future<List<NewModel>> getNews(Params param) async {
    try {
      List<NewModel> listNew = [];
      final results = await _client.get(
          '$_urlBase?q=${param.category}&apiKey=${EnvironmentConfig.apiUrl}&pageSize=100&language=${param.languaje}&excludeDomains=hipertextual.com');
      if (results.statusCode == 200) {
        final data = results.data['articles'];
        for (var element in data) {
          listNew.add(NewModel.fromJson(element));
        }
        return listNew;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
