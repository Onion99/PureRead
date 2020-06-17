
import 'package:pure_read/page/eyepetizer/model/Issue_entity.dart';
import 'package:pure_read/provider/view_state_refresh_list_model_eyepetizerhome.dart';
import 'package:pure_read/service/fnews_repository.dart';

class EyepetizerHomeModel extends ViewStateRefreshListModelToEyepetizer<ItemList>{
  static String nextPageUrl;
  @override
  Future<List<ItemList>> loadData({int pageNum}) async {
    
    return await FnewsRepository.requestEyepetizerHomeNews();
  }

}