
import 'package:pure_read/page/eyepetizer/model/rank_entity.dart';
import 'package:pure_read/provider/view_state_list_model.dart';
import 'package:pure_read/provider/view_state_refresh_list_model.dart';
import 'package:pure_read/service/eyppetizer_repository.dart';

class EyepetizerHotViewModel extends ViewStateListModel<ItemList>{
  String rankUrl;
  @override
  Future<List<ItemList>> loadData() async {
    
    return await EyepetizerRepository.requestEyepetizerRankNews(rankUrl);
  }
  
}