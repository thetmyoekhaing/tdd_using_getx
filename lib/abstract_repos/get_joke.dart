import 'package:dartz/dartz.dart';
import 'package:getx_testing/RANDOM/joke/model/joke_model.dart';
import 'package:getx_testing/error/failure.dart';

abstract class GetJoke {
  Future<Either<Failure, JokeModel>> getDataFromApi();
}
