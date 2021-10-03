import 'package:dio/dio.dart';

String errorHandler(dynamic e){
    switch (e.runtimeType) {
    case Exception:
      return e.toString();
    case DioError:
      e as DioError;
      if (e.message.contains('Failed host lookup')) return 'Please make sure you’re connected to the internet and try again.';
      return e.message;
    default:
      return e.toString();
  }
}