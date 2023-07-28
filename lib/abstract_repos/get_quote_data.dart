import 'package:dartz/dartz.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/ramdom/quote/models/quote_model.dart';

abstract class GetQuoteData {
  Future<Either<Failure, QuoteModel>> getDataFromApi();
}
