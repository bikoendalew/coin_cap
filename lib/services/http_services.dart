import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HttpServices {
  final Dio dio = Dio();
  AppConfig? appConfig;
  String? baseUrl;
  HttpServices() {
    appConfig = GetIt.instance.get<AppConfig>();
    baseUrl = appConfig!.COIN_API_BASE_URL;
  }
  Future<Response?> get(String url) async {
    try {
      String path = "$baseUrl$url";
      Response response = await dio.get(path);
      return response;
    } catch (e) {
      print('HTTPService: Unable to perform get request.');
      print(e);
    }
  }
}
