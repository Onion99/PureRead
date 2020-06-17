import 'dart:convert';

import 'package:pure_read/common/dao/result_data_new.dart';
import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/common/net/http_manager.dart';
import 'package:pure_read/model/heroinfo.dart';
import 'package:pure_read/model/news.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/GuokeDay.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/guoke_new.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/guoke_newdetail.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/guoke_result.dart';
import 'package:pure_read/page/aggregationnews/model/ReadHub/readhub_result.dart';
import 'package:pure_read/page/aggregationnews/model/result_zhihu.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday_detail.dart';
import 'package:pure_read/page/eyepetizer/model/Issue_entity.dart';
import 'package:pure_read/page/one_time/model/model_bing/result_bing_photos.dart';
import 'package:pure_read/page/one_time/model/one_say.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpDao {
  static final String loadingImage = "https://i.picsum.photos/id/866/800/500.jpg";

  /// VG HERO
  static Future<List<HeroInfo>> getHeroInfo() async {
    var res = await httpManager.netFetch(Address.heroInfo, null, null,
        new Options(responseType: ResponseType.plain));
    String heroInfo = res.toString().substring(27, res.toString().length - 2);
    final parsed = json.decode(heroInfo).cast<Map<String, dynamic>>();
    List<HeroInfo> items =
        parsed.map<HeroInfo>((json) => HeroInfo.fromJson(json)).toList();
    print(items[0].toString());
    return items;
  }

  /// WANGYI NEWS LIST
  static Future<List<News>> getNewsDao(int pageNum) async {
    String url = "https://api.apiopen.top/getWangYiNews?page=$pageNum";
    var res = await httpManager.netFetch(
        url, null, null, new Options(responseType: ResponseType.plain));
    ResultDataNews dataNews = ResultDataNews.fromJson(res.toString());
    return dataNews.result;
  }

  /// ZHIHU NEWS LIST
  static Future getZhihuNewsDao() async {
    String url = "https://zhihu-daily.leanapp.cn/api/v1/last-stories";
    var res = await httpManager.netFetch(
        url, null, null, new Options(responseType: ResponseType.plain));
    var length = res.toString().length;
    ResultZhihu dataNews =
        ResultZhihu.fromJson(res.toString().substring(11, length - 1));
    print(dataNews.stories[1].toString());
    return dataNews.stories;
  }
  // 之前爬取过多，IP被封，官方接口已不能用
  // 知乎日报官方接口
  static Future getZhihuNewsDaoByDate(String date) async {
    String url = "https://zhihu-daily.leanapp.cn/api/v1/before-stories/$date";
    var res = await httpManager.netFetch(
        url, null, null, new Options(responseType: ResponseType.plain));
    var length = res.toString().length;
    ResultZhihu dataNews =
        ResultZhihu.fromJson(res.toString().substring(11, length - 1));
    return dataNews.stories;
  }
  static Future getZhihuNewsDaoByDateNew(String date) async {
    // 知乎日报第三方接口
    String url = "http://63.209.32.7:8010/news/before/$date";
    // 官网接口
//    String url = "https://zhihu-daily.leanapp.cn/api/v1/before-stories/$date";
    var res = await httpManager.netFetch(
        url, null, null, new Options(responseType: ResponseType.plain));
    var length = res.toString().length;
    ResultZhihu dataNews =
        ResultZhihu.fromJson(res.toString());
    return dataNews.stories;
  }

  /// ZHIHU NEWS CONTENT
  static Future getZhihuNewsDetailDao(String id) async {
//    String url = "https://zhihu-daily.leanapp.cn/api/v1/contents/" + id;
    String url = "http://news-at.zhihu.com/api/4/news/"+id;
//    String url = "http://63.209.32.7:8010/news/"+id ;
    var res = await httpManager.netFetch(
        url, null, null, new Options(responseType: ResponseType.plain));
    var length = res.toString().length;
//    ZhihuDayDetail dataNews = ZhihuDayDetail.fromJson(res.toString().substring(12, length - 1));
    ZhihuDayDetail dataNews = ZhihuDayDetail.fromJson(res.toString());
    return dataNews;
  }

  /// GUOKE
  static Future<List<GuokeDay>> getGuokeNews(int offset) async {

    String url = "https://www.guokr.com/apis/minisite/article.json?retrieve_type=by_channel&channel_key=${Address.guokeTitle[0]}&offset=$offset&limit=20";
//    String url = "https://www.guokr.com/apis/minisite/article.json?retrieve_type=by_category&page=$offset&channel_key=${Address.guokeTitle[0]}";
    var res = await httpManager.netFetch(
        url,
        null,
        null,
        Options(responseType: ResponseType.plain));
//    Map requestParams = {"retrieve_type":"by_channel","channel_key":"hot"};
//    var res = await httpManager.netFetch(
//        Address.guokeNews,
//        requestParams,
//        null,
//        Options(responseType: ResponseType.plain));
    GuokeResult result = GuokeResult.fromJson(res.toString());
    return result.result;
  }
  /// GUOKE
  static Future<GuokeNewDetail> getGuokeNewsDetail(String jsonurl) async {
    debugPrint("JSONURL:"+jsonurl);
    var res = await httpManager.netFetch(
        jsonurl,
        null,
        null,
        Options(responseType: ResponseType.plain));
     debugPrint("res:"+res);   
    GuokeNewDetail result = GuokeNewDetail.fromJson(res.toString());
    return result;
  }
  static Future<List<Guokenews>> getGuokeNewsNew(int offset) async {

    String url = "https://www.guokr.com/beta/proxy/science_api/articles?retrieve_type=by_category&page=$offset&limit=10";
    var res = await httpManager.netFetch(
        url,
        null,
        null,
        Options(responseType: ResponseType.plain));
    List<Guokenews> result = Guokenews.fromJson(res.toString()) as List<Guokenews>;
    return result;
  }
  /// ReadHub
  static getReadNews(int cursor) async {
//    String url = "https://api.readhub.cn/topic";
    String url = "https://api.readhub.cn/topic?lastCursor=$cursor&pageSize=20";
    var res = await httpManager.netFetch(
        url,
        null,
        null,
        Options(responseType: ResponseType.plain));
//    Map requestParams = {"retrieve_type":"by_channel","channel_key":"hot"};
//    var res = await httpManager.netFetch(
//        Address.guokeNews,
//        requestParams,
//        null,
//        Options(responseType: ResponseType.plain));
    ReadhubResult result = ReadhubResult.fromJson(res.toString());
    return result.data;
  }
  /// HitoKito
  static  getHitokito() async {
    var res = await httpManager.netFetch(
        Address.hitokito,
        null,
        null,
        Options(responseType: ResponseType.plain));
    OneSay result = OneSay.fromJson(res.toString());
    return result;
  }
  /// Bing
  static  getBingPhoto() async {
    var res = await httpManager.netFetch(
        Address.bingPhoto,
        null,
        null,
        Options(responseType: ResponseType.plain));
    ResultBingPhotoData result = ResultBingPhotoData.fromJson(res);
    return result.images;
  }

  /// get Eyepetizer News
  static getEyepetizerHotNews(String url) async{
    var res = await httpManager.netFetch(
        url,
        null,
        null,
        Options(responseType: ResponseType.plain));
    IssueList issue = IssueList.fromJson(res);
    return issue.itemList;
  }
  static getEyepetizerBaner(String date) async{
    var res = await httpManager.netFetch(
        Address.BANER,
        null,
        null,
        Options(responseType: ResponseType.plain));
    IssueEntity dataHub = IssueEntity.fromJson(res);
    nextPageUrl = dataHub.nextPageUrl;
    return dataHub.issueList[0].itemList;
  }
  static String nextPageUrl = "";
  static getEyepetizerNextPage( ) async{
    var res = await httpManager.netFetch(
        nextPageUrl,
        null,
        null,
        Options(responseType: ResponseType.plain));
    IssueList issue = IssueList.fromJson(res);
    nextPageUrl = issue.date.toString();
    return issue.itemList;
  }
}
