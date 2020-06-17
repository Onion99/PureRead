
import 'package:pure_read/page/aggregationnews/model/Guoke/GuokeDay.dart';
import 'package:pure_read/provider/view_state_refresh_list_model.dart';
import 'package:pure_read/service/fnews_repository.dart';

class GuokeNewsModel extends ViewStateRefreshListModel<GuokeDay>{
  @override
  Future<List<GuokeDay>> loadData({int pageNum}) async {
    // TODO: implement loadData
    return await FnewsRepository.requestGuokeNewsRefresh(pageNum*30);
  }

}