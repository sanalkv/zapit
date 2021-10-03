import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zapit/core/constants/constants.dart';
import 'package:zapit/core/helpers/error_handler.dart';
import 'package:zapit/core/model/coins_list_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio()..interceptors.add(PrettyDioLogger(requestBody: true));
    dio.interceptors.add(_interceptorsWrapper());
    dio.options.headers.addAll({'authorization': 'Apikey $apiKey'});
    return ApiService(dio);
  }

  @GET('/data/top/totalvolfull')
  Future<CoinsListResponse> listCoins(@Query('tsym') String tsym);
}

InterceptorsWrapper _interceptorsWrapper() {
  return InterceptorsWrapper(
    onResponse: (response, handler) {
      if (response.data['Response'] == 'Error') handler.reject(DioError(requestOptions: response.requestOptions, error: response.data['Message']));
      handler.next(response);
    },
    onError: (e, handler) {
      final String errorString = errorHandler(e);
      DioError error = DioError(requestOptions: e.requestOptions, response: e.response, type: e.type, error: errorString);
       handler.next(error);
    },
  );
}
