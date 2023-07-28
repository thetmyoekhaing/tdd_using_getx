import 'package:dartz/dartz.dart';
import 'package:getx_testing/RANDOM/riddle/model/riddle_model.dart';
import 'package:getx_testing/error/failure.dart';

abstract class GetRiddle {
  Future<Either<Failure, RiddleModel>> getDataFromApi();
}
