import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:getx_testing/RANDOM/joke/model/joke_model.dart';
import 'package:getx_testing/abstract_repos/get_joke.dart';
import 'package:getx_testing/error/failure.dart';

class GetJokeUseCase {
  GetJoke repo;
  GetJokeUseCase(this.repo);

  Future<Either<Failure, JokeModel>> call() {
    debugPrint("--------------------- Hello From UseCase ------------------");

    return repo.getDataFromApi();
  }
}
