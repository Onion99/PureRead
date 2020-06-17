
import 'package:pure_read/page/aggregationnews/model/ReadHub/ReadhubDay.dart';
import 'package:pure_read/provider/view_state_refresh_list_model.dart';
import 'package:pure_read/service/fnews_repository.dart';

class ReadhubNewsModel extends ViewStateRefreshListModel<ReadhubDay>{
   static var cursor =0;
  @override
  Future<List<ReadhubDay>> loadData({int pageNum}) async {
    // TODO: implement loadData
    return await FnewsRepository.requestReadhubNewsRefresh(cursor);
  }
}