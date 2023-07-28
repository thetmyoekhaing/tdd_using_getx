import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/RANDOM/riddle/model/riddle_model.dart';
import 'package:getx_testing/abstract_repos/get_riddle.dart';
import 'package:getx_testing/error/failure.dart';

class GetRiddleUseCase {
  GetRiddle repo;
  GetRiddleUseCase(this.repo);

  Future<Either<Failure, RiddleModel>> call() {
    debugPrint("--------------------- Hello From UseCase ------------------");

    return repo.getDataFromApi();
  }
}
