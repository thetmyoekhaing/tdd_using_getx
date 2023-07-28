import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_testing/abstract_repos/get_quote_data.dart';
import 'package:getx_testing/api/get_quote_api.dart';
import 'package:getx_testing/error/failure.dart';
import 'package:getx_testing/error/server_exception.dart';
import 'package:getx_testing/ramdom/quote/models/quote_model.dart';
import 'package:getx_testing/repo_impl/get_quote.dart';
import 'package:getx_testing/usecases/get_quote_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'json/json_reader.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([GetQuoteData, GetQuoteImpl])
void main() {
  group("getQuoteData", () {
    late MockGetQuoteData repo;
    late GetQuoteUseCase useCase;
    late MockGetQuoteImpl mockGetQuoteImpl;
    setUp(() {
      repo = MockGetQuoteData();
      useCase = GetQuoteUseCase(repo);
      mockGetQuoteImpl = MockGetQuoteImpl();
    });

    test(
      "should return QuoteModel when api call is successful",
      () async {
        // arrange
        final tQuoteModel =
            QuoteModel.fromJson(jsonDecode(jsonReader("testing.json")));

        when(mockGetQuoteImpl.getDataFromApi())
            .thenAnswer((_) async => Right(tQuoteModel));
        // act
        final result = await mockGetQuoteImpl.getDataFromApi();
        // assert
        expect(result, Right(tQuoteModel));
      },
    );

    test(
      "should return Server Execption when the api call is unsuccessful",
      () async {
        final Failure tServerException = ServerExecption(message: "hello");
        // arrange
        when(repo.getDataFromApi())
            .thenAnswer((_) async => Left(tServerException));
        // act
        final result = await useCase();
        // assert
        expect(result, Left(tServerException));
        verify(repo.getDataFromApi());
      },
    );
  });
}
