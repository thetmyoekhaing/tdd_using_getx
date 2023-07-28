import 'package:json_annotation/json_annotation.dart';
part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel {
  final String quote;
  final String author;
  final String category;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  /// Connect the generated [_QuoteModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

  const QuoteModel(
      {required this.quote, required this.author, required this.category});
}
