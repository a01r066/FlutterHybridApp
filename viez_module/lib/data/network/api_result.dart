class ApiResult<T, V> {
  T? response;
  V? exception;

  ApiResult({
    this.response,
    this.exception,
  });

  bool isSuccess(){
    if(exception == null && response != null){
      return true;
    }
    return false;
  }
}