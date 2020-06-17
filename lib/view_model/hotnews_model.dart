
import 'package:pure_read/model/news.dart';
import 'package:pure_read/provider/view_state_refresh_list_model.dart';
import 'package:pure_read/service/fnews_repository.dart';

class HotNewsModel extends ViewStateRefreshListModel<News>{
  @override
  Future<List<News>> loadData({int pageNum}) async {
    // TODO: implement loadData
    return await FnewsRepository.requestNewsRefresh(pageNum);
  }
}