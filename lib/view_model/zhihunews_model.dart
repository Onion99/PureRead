
import 'package:pure_read/page/aggregationnews/model/zhihuday.dart';
import 'package:pure_read/provider/view_state_list_model.dart';
import 'package:pure_read/service/fnews_repository.dart';
import 'package:intl/intl.dart';

class ZhihuNewsModel extends ViewStateListModel<ZhihuDay>{
  final dateFormat = new DateFormat("yyyyMMdd");
  static DateTime dateTimeSelect = DateTime.now();

  @override
  Future<List<ZhihuDay>> loadData() async {
    // TODO: implement loadData
    final String dateFormated = dateTimeSelect == null ? dateFormat.format(DateTime.now()) : dateFormat.format(dateTimeSelect);
    print(dateFormated);
    return await FnewsRepository.requestZhihuNewsByDate(dateFormated);
  }

}