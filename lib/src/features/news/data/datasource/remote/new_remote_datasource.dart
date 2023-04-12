import '../../../../../core/utils/params.dart';
import '../../models/new_model.dart';

abstract class NewRemoteDatasource {
  Future<List<NewModel>> getNews(Params param);
}
