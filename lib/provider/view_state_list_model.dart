
import 'package:pure_read/provider/view_state_model.dart';

abstract class ViewStateListModel<T> extends ViewStateModel{

  /// page data list
  List<T> list = [];

  /// First Loading
  initData() async{
    setBusy();
    await refresh(init: false);
  }

  /// Refresh Data
  refresh({bool init =false}) async{
    try{
      List<T> data = await loadData();
      if(data.isEmpty){
        list.clear();
        setEmpty();
      }
      else{
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    }
    catch(e,s){
      if(init) list.clear();
      setError(e, s);
    }
  }

  // Loading Data
  Future<List<T>> loadData();
  // Completed loading
  onCompleted(List<T> data) {}
}