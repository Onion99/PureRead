import 'package:pure_read/common/dao/httpflutter.dart';
import 'package:pure_read/page/eyepetizer/model/rank_entity.dart';

class EyepetizerRepository {
  
  static Future<List<ItemList>> requestEyepetizerRankNews(
      String rankUrl) async {
    var response = await HttpFlutter.getDatas(rankUrl);
    var issueEntity = RankRntity.fromJson(response);
    var items = issueEntity.itemList;
    items.removeWhere((item) {
      return item.type == 'banner2';
    });
    return issueEntity.itemList;
  }
}
