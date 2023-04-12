import 'package:isar/isar.dart';

import '../../../../../core/error/exception.dart';
import '../../../domain/entities/news.dart';
import '../../models/new_model.dart';
import 'new_local_datasource.dart';

class IsarNewLocalDatasourse extends NewLocalDatasource {
  IsarNewLocalDatasourse({required Isar isar}) : _isar = isar;
  final Isar _isar;

  @override
  Future<List<New>> getNew() async {
    try {
      final List<NewModel> listNewModel =
          await _isar.newModels.where().findAll();
      List<New> listNew = [];
      for (var element in listNewModel) {
        listNew.add(element.toNew);
      }
      return listNew;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  saveNew(List<NewModel> news) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.newModels.where().deleteAll();
        await _isar.newModels.putAll(news); // perform update operations
      });
    } catch (e) {
      throw CacheException();
    }
  }
}
