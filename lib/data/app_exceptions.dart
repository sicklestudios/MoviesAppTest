class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString() {
    return _prefix + _message;
  }
}

//Exception  for internet
class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}

//
class RequestTimedOutException extends AppExceptions {
  RequestTimedOutException([String? message])
      : super(message, "Request Timed Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Error Fetching Data");
}
