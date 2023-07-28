import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/abstract_repos/get_quote_data.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/RANDOM/quote/models/quote_model.dart';

class GetQuoteUseCase {
  GetQuoteData repo;
  GetQuoteUseCase(this.repo);

  Future<Either<Failure, QuoteModel>> call() {
    debugPrint("--------------------- Hello From UseCase ------------------");

    return repo.getDataFromApi();
  }
}
