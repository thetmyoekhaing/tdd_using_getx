import 'package:dio/dio.dart';
import 'package:getx_testing/dotenv.dart';

class GetApi {
  final String apiEndpoint;
  final String route;
  Dio dio = Dio();

  GetApi(this.apiEndpoint, this.route);
  Future get() async {
    final Map<String, dynamic> headers = {"X-Api-Key": API_KEY};
    final res =
        await dio.get("$apiEndpoint$route", options: Options(headers: headers));
    return res.data;
  }
}
