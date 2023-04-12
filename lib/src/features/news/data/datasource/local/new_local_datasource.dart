import 'package:news_project/src/features/news/data/models/new_model.dart';

import '../../../domain/entities/news.dart';

abstract class NewLocalDatasource {
  Future<List<New>> getNew();
  saveNew(List<NewModel> news);
}
