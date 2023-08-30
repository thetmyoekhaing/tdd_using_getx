import 'package:dio/dio.dart';

class GetApi {
  final String apiEndpoint;
  final String route;
  Dio dio = Dio();

  GetApi(this.apiEndpoint, this.route);
  Future get() async {
    final res =
        await dio.get("$apiEndpoint$route", options: Options(headers: {}));
    return res.data;
  }
}
