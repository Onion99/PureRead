import 'package:pure_read/page/eyepetizer/model/Issue_entity.dart';
import 'package:pure_read/provider/view_state_list_model.dart';
import 'package:pure_read/service/fnews_repository.dart';

class EyepetizerBannerModel extends ViewStateListModel<ItemList>{
  @override
  Future<List<ItemList>> loadData() async {
    return await FnewsRepository.requestEyepetizerBaner();
  }

}