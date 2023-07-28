import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:getx_testing/abstract_repos/get_quote_data.dart';
import 'package:getx_testing/api/get_quote_api.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';
import 'package:getx_testing/ramdom/quote/models/quote_model.dart';

/// return QuoteModel when api call is successful
///
/// return `ServerException` when api call is unsuccessful

class GetQuoteImpl implements GetQuoteData {
  @override
  Future<Either<Failure, QuoteModel>> getDataFromApi() async {
    try {
      final data = await GetQuoteApi().getQuote();
      return Right(QuoteModel.fromJson(jsonDecode(data)));
    } on ServerExecption catch (e) {
      throw ServerExecption(message: e.message);
    }
  }
}
