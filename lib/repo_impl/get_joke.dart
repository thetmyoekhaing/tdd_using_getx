import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/RANDOM/joke/model/joke_model.dart';
import 'package:getx_testing/abstract_repos/get_joke.dart';
import 'package:getx_testing/api/api_endpoint.dart';
import 'package:getx_testing/api/get_api.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';

/// return QuoteModel when api call is successful
///
/// return `ServerException` when api call is unsuccessful

class GetJokeImpl implements GetJoke {
  @override
  Future<Either<Failure, JokeModel>> getDataFromApi() async {
    debugPrint("--------------------- Hello from impl ------------------");

    try {
      final data = await GetApi(API_ENDPOINT, "jokes").get();
      debugPrint("--------------------- Hello from impl ------------------");
      return Right(JokeModel.fromJson(data[0]));
    } on ServerExecption catch (e) {
      throw ServerExecption(message: e.message);
    }
  }
}
