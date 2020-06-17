import 'dart:io';

import 'package:pure_read/config/net/api.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/// 我的页面状态类型
enum ViewState {
  idle, //空闲
  busy, //加载中
  empty, //无数据
  error, //加载失败
}

/// 错位类型
enum ViewStateErrorType {
  defaultError, // 默认错误
  networkTimeOutError, // 网络错误
  unauthorizedError // 授权错误
}

/// 我的页面错误状态类型
class ViewSateError {
  ViewStateErrorType _errorType;
  String meassage;
  String errorMessage;

  // 构造方法
  ViewSateError(this._errorType, {this.meassage, this.errorMessage}) {
    // ?? 表示变量如果值为空，则将赋值
    _errorType ??= ViewStateErrorType.defaultError;
    meassage ??= errorMessage;
  }

  // get errorType
  ViewStateErrorType get errorType => _errorType;

  get isDefaultError => _errorType == ViewStateErrorType.defaultError;

  get isNetWorkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;

  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewSateError{_errorType: $_errorType, meassage: $meassage, errorMessage: $errorMessage}';
  }
}

class ViewStateModel with ChangeNotifier {
  /// 防止页面销毁后，异步任务还在执行，导致报错
  bool _disposed = false;

  /// 当前页面状态，默认为缓冲态
  ViewState _viewState;

  // Get ViewState
  ViewState get viewState => _viewState;

  /// Set ViewState
  set viewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  /// 当前页面错误状态
  ViewSateError _viewStateError;

  // get ViewStateError
  ViewSateError get viewStateError => _viewStateError;

  // set ViewStateError
  void setError(e, stackTrace, {String message}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;

    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          errorType = ViewStateErrorType.networkTimeOutError;
          message = e.error;
          break;
        case DioErrorType.RESPONSE:
          message = e.error;
          break;
        case DioErrorType.CANCEL:
          message = e.error;
          break;
        case DioErrorType.DEFAULT:
        // 将Dio原error重新包装
          e = e.error;
          if (e is UnAuthorizedException) {
            stackTrace = null;
            errorType = ViewStateErrorType.unauthorizedError;
          } else if (e is NotSuccessException) {
            stackTrace = null;
            message = e.message;
          } else if (e is SocketException) {
            errorType = ViewStateErrorType.networkTimeOutError;
            message = e.message;
          } else {
            message = e.message;
          }
      }
    }
    viewState = ViewState.error;
    _viewStateError = ViewSateError(
      errorType,
      meassage: message,
      errorMessage: e.toString(),
    );
    printErrorStack(e, stackTrace);
    onError(viewStateError);
  }

  /// set status
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  /// get status
  bool get isBusy => viewState == ViewState.busy;

  bool get isIdle => viewState == ViewState.idle;

  bool get isEmpty => viewState == ViewState.empty;

  bool get isError => viewState == ViewState.error;

  /// 根据状态构造
  // 子类可以在构造函数指定页面状态
  ViewStateModel({ViewState viewState})
      : _viewState = ViewState ?? ViewState.idle {
    debugPrint('ViewStateModel---constructor--->$runtimeType');
  }
  // 错误处理
  void onError(ViewSateError viewStateError) {}
  // 展示错误
  showErrorMessage(context, {String message}) {
    if (viewStateError != null || message != null) {
      if (viewStateError.isNetWorkTimeOut) {
        message ??= "viewStateMessageNetworkError";
      } else {
        message ??= viewStateError.meassage;
      }
      Future.microtask(() {
        showToast(message, context: context);
      });
    }
  }

  @override
  void notifyListeners() {
    if(!_disposed){
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }

  @override
  String toString() {
    return 'ViewStateModel{_disposed: $_disposed, _viewState: $_viewState, _viewStateError: $_viewStateError}';
  }

}

/// [e]为错误类型 :可能为 Error , Exception ,String
/// [s]为堆栈信息
printErrorStack(e, s) {
  debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}
