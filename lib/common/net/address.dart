
class Address{
  static const String heroInfo = "http://vg.163.com/data/heroes.json";
  /// guoke
  static const guokeTitle =["hot"];
  static const String guokeNews = "https://www.guokr.com/apis/minisite/article.json";
  /// hitokito
  static const String hitokito = "https://v1.hitokoto.cn/";
  /// Bing 美图
  /// idx 日期，n 数量 ，format 格式，cc 区域
  static const String bingPhoto = "https://cn.bing.com/HPImageArchive.aspx?format=js&cc=cn&idx=0&n=10";
  /// Bing图片链接 + base url + bingsize
  static const String bingPhotoPng = "http://s.cn.bing.net";
  /// Bing photo size
  /// 1920x1200   1920x1080    1366x768   1280x768
  //  1024x768    800x600       800x480   768x1280
  //  720x1280    640x480       480x800   400x240
  //  320x240     240x320
  static const String bingPhotoSize = "_720x1280.jpg";
//  static const String bingPhotoSize = "_1920x1080.jpg";

  // Eyepetizer Url
  static const String WEEKLY_RANKING =
      "http://baobab.kaiyanapp.com/api/v4/rankList/videos?strategy=weekly";
  static const String MONTHLY_RANKING =
      "http://baobab.kaiyanapp.com/api/v4/rankList/videos?strategy=monthly";
  static const String TOTALLY_RANKING =
      "http://baobab.kaiyanapp.com/api/v4/rankList/videos?strategy=historical";
  static const String BANER = "http://baobab.kaiyanapp.com/api/v2/feed?num=1";

  static String durationFormat(int duration) {
    int minute = duration ~/ 60;
    int second = duration % 60;
    if (minute <= 9) {
      if (second <= 9) {
        return "0${minute}' 0${second}''";
      } else {
        return "0${minute}' ${second}''";
      }
    } else {
      if (second <= 9) {
        return "${minute}' 0${second}''";
      } else {
        return "${minute}' ${second}''";
      }
    }
  }
}