import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/RANDOM/riddle/model/riddle_model.dart';
import 'package:getx_testing/abstract_repos/get_riddle.dart';
import 'package:getx_testing/api/api_endpoint.dart';
import 'package:getx_testing/api/get_api.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';

/// return QuoteModel when api call is successful
///
/// return `ServerException` when api call is unsuccessful

class GetRiddleImpl implements GetRiddle {
  @override
  Future<Either<Failure, RiddleModel>> getDataFromApi() async {
    debugPrint("--------------------- Hello from impl ------------------");

    try {
      final data = await GetApi(API_ENDPOINT, "riddles").get();
      return Right(RiddleModel.fromJson(data[0]));
    } on ServerExecption catch (e) {
      throw ServerExecption(message: e.message);
    }
  }
}
