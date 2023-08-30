import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/riddle/controller/riddle_controller.dart';
import 'package:getx_testing/RANDOM/riddle/model/riddle_model.dart';
import 'package:getx_testing/abstract_repos/get_riddle.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';
import 'package:getx_testing/repo_impl/get_riddle.dart';
import 'package:getx_testing/usecases/get_riddle_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'json/json_reader.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([RiddleController, GetRiddle, GetRiddleImpl])
void main() {
  group("getRiddleData", () {
    late MockGetRiddle repo;
    late GetRiddleUseCase useCase;
    setUp(() {
      repo = MockGetRiddle();
      useCase = GetRiddleUseCase(repo);
    });

    test(
      "should return RiddleModel when api call is successful",
      () async {
        // arrange
        final tRiddle =
            RiddleModel.fromJson(jsonDecode(jsonReader("testing.json")));

        when(useCase.getDataFromApi()).thenAnswer((_) async => Right(tRiddle));
        // act
        final result = await useCase.getDataFromApi();
        // assert
        expect(result, Right(tRiddle));
      },
    );

    test(
      "should return Server Execption when the api call is unsuccessful",
      () async {
        final Failure tServerException = ServerExecption(message: "hello");
        // arrange
        when(useCase.getDataFromApi())
            .thenAnswer((_) async => Left(tServerException));
        // act
        final result = await useCase.getDataFromApi();
        // assert
        expect(result, Left(tServerException));
      },
    );
  });

  group("riddle show answer", () {
    late MockRiddleController mockRiddleController;

    setUp(() {
      mockRiddleController = MockRiddleController();
    });
    test(
      "show return isShowed = true when onTapping showOnTap",
      () async {
        // arrange
        when(mockRiddleController.isShowed).thenReturn(false.obs);
        when(mockRiddleController.showOnTap())
            .thenAnswer((_) => mockRiddleController.isShowed.value = true);
        // act
        final result = mockRiddleController.showOnTap();
        // assert
        expect(result, mockRiddleController.isShowed.value);
      },
    );
  });
}
