import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_dto.g.dart';

@JsonSerializable()
class PriceDto {
  const PriceDto({required this.value, required this.currency});
  final String value;
  final String currency;

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDtoToJson(this);

  static JsonTypeConverter<PriceDto, String> converter = TypeConverter.json(
    fromJson: (json) => PriceDto.fromJson(json as Map<String, Object?>),
    toJson: (pref) => pref.toJson(),
  );
}
