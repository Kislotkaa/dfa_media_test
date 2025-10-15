enum AppResponseStatus { success, error }

class AppResponse<Data, Error extends GatewayError> {
  final Data? data;
  final Error? error;
  final AppResponseStatus _status;

  AppResponse.success({this.data})
      : _status = AppResponseStatus.success,
        error = null;
  AppResponse.error(this.error)
      : _status = AppResponseStatus.error,
        data = null;

  bool get isSuccess => _status == AppResponseStatus.success;
  bool get isError => _status == AppResponseStatus.error;
}

enum GatewayError {
  timeOut,
  somethingWrong,
  serverUnavailable;
}
