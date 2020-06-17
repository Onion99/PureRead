
import 'package:pure_read/provider/view_state_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

abstract class ViewStateRefreshListModelToEyepetizer<T> extends ViewStateListModel<T>{
  // page first
  static const int pageNumFirst = 0;
  // page size
  static const int pageSize = 3;
  // currentPageNum
  int _currentPageNum = pageNumFirst;
  // controller
  EasyRefreshController _refreshController = EasyRefreshController();
  // get Controller
  EasyRefreshController get refreshController => _refreshController;

  // Refresh Data
  Future<List<T>> refresh({bool init = false}) async{
    refreshController.callRefresh(duration: Duration(milliseconds: 1600));
    try{
      _currentPageNum = pageNumFirst;
      var data = await loadData(pageNum: pageNumFirst);
      if(data.isEmpty){
        refreshController.finishRefresh(success: false,noMore: false);
        list.clear();
        setEmpty();
      }
      else{
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.finishRefresh(success: true,noMore: false);
        setIdle();
      }
      return data;
    }
    catch(e,s){
      _currentPageNum--;
      refreshController.finishRefresh(success: true,noMore: false);
      debugPrint('error--->\n' + e.toString());
      debugPrint('statck--->\n' + s.toString());
      return null;
    }
  }
  // load data
  Future<List<T>> loadData({int pageNum});
  // load more data
  Future<List<T>> loadMore() async{
//    refreshController.callLoad(duration: Duration(milliseconds: 1600));
    try{
      var data = await loadData(pageNum: ++_currentPageNum);
      // data is Null
      if(data.isEmpty){
        _currentPageNum--;
        refreshController.finishLoad(success: true,noMore: true);
      }
      else{
        onCompleted(data);
        list.addAll(data);
        // data maybe Null
        if(data.length < pageSize){
          refreshController.finishLoad(success: true,noMore: true);
        }
        else{
          refreshController.finishLoad(success: true,noMore: false);
        }
        notifyListeners();
      }
      return data;
    }
    catch(e,s){
      _currentPageNum--;
      refreshController.finishLoad(success: false,noMore: false);
      debugPrint('error--->\n' + e.toString());
      debugPrint('statck--->\n' + s.toString());
      return null;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    refreshController.dispose();
    super.dispose();
  }
}