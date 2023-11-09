import 'package:dio/dio.dart';
import 'package:pokemon/view_model/network/remote/endpoints.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: EndPoints.baseUrl,
      ),
    );
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      endpoint,
      queryParameters: query,
    );
  }
}
