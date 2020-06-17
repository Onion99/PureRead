
/// 状态类型
enum ViewState {
  idle, //空闲
  busy, //加载中
  empty, //无数据
  error, //加载失败
}

/// 错误类型
enum ViewStateErrorType {
  defaultError, // 默认错误
  networkTimeOutError, // 网络错误
  unauthorizedError // 授权错误
}

class ViewStateError {
  ViewStateErrorType _errorType;
  String message;
  String errorMessage;
  // 构造方法
  ViewStateError(this._errorType, {this.message, this.errorMessage}) {
    // ?? 表示变量如果值为空，则将赋值
    _errorType ??= ViewStateErrorType.defaultError;
    message ??= errorMessage;
  }
  // get errorType
  ViewStateErrorType get errorType => _errorType;
  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;
  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $_errorType, message: $message, errorMessage: $errorMessage}';
  }
}

//enum ConnectivityStatus { WiFi, Cellular, Offline }
