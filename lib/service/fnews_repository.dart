import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/common/dao/httpflutter.dart';
import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/model/news.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/GuokeDay.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/guoke_new.dart';
import 'package:pure_read/page/aggregationnews/model/ReadHub/ReadhubDay.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday.dart';
import 'package:pure_read/page/eyepetizer/model/Issue_entity.dart';
import 'package:pure_read/view_model/eyepetizerhome_model.dart';

class FnewsRepository {
  static Future<List<News>> requestNewsRefresh(int pageNum) async {
    List<News> list = await HttpDao.getNewsDao(pageNum);
    return list;
  }

  static Future<List<ZhihuDay>> requestZhihuNewsByDate(String date) async {
    List<ZhihuDay> list = await HttpDao.getZhihuNewsDaoByDate(date);
    return list;
  }

  static Future<List<GuokeDay>> requestGuokeNewsRefresh(int pageNum) async {
    List<GuokeDay> list = await HttpDao.getGuokeNews(pageNum);
    return list;
  }

  static Future<List<Guokenews>> requestGuokeNewsRefreshNew(int pageNum) async {
    List<Guokenews> list = await HttpDao.getGuokeNewsNew(pageNum);
    return list;
  }

  static Future<List<ReadhubDay>> requestReadhubNewsRefresh(int cursor) async {
    List<ReadhubDay> list = await HttpDao.getReadNews(cursor);
    return list;
  }

  static Future<List<ItemList>> requestEyepetizerHotNews(String url) async {
    List<ItemList> list = await HttpDao.getEyepetizerHotNews(url);
    return list;
  }

  static Future<List<ItemList>> requestEyepetizerBaner() async {
    IssueEntity issueEntity;
    var response = await HttpFlutter.getDatas(Address.BANER);
    issueEntity = IssueEntity.fromJson(response);
    var items = issueEntity.issueList[0].itemList;
    EyepetizerHomeModel.nextPageUrl = issueEntity.nextPageUrl;
    items.removeWhere((item) {
      return item.type == 'banner2';
    });
    return issueEntity.issueList[0].itemList;
  }

  static Future<List<ItemList>> requestEyepetizerHomeNews() async {
    var response = await HttpFlutter.getDatas(EyepetizerHomeModel.nextPageUrl);
    var issueEntity = IssueEntity.fromJson(response);
    EyepetizerHomeModel.nextPageUrl = issueEntity.nextPageUrl;
    var items = issueEntity.issueList[0].itemList;
    items.removeWhere((item) {
      return item.type == 'banner2';
    });
    print(items.toString());
    return issueEntity.issueList[0].itemList;
  }
}

