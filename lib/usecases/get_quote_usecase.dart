import 'package:dartz/dartz.dart';
import 'package:getx_testing/abstract_repos/get_quote_data.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/ramdom/quote/models/quote_model.dart';

class GetQuoteUseCase {
  GetQuoteData repo;
  GetQuoteUseCase(this.repo);

  Future<Either<Failure, QuoteModel>> call() {
    return repo.getDataFromApi();
  }
}
