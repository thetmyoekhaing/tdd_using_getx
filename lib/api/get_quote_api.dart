import 'package:dio/dio.dart';
import 'package:getx_testing/api/api_endpoint.dart';
import 'package:getx_testing/dotenv.dart';

class GetQuoteApi {
  Dio dio = Dio();
  Future getQuote() async {
    final Map<String, dynamic> headers = {"X-Api-Key": API_KEY};
    final res =
        await dio.get(quoteApiEndpoint, options: Options(headers: headers));
    return res.data;
  }
}
