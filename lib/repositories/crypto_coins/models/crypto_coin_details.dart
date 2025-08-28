import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.priceInUSD,
    required this.imageUrl,
    this.toSymbol,
    this.lastUpdate,
    this.hei24Hours,
    this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com$imageUrl';

  @HiveField(2)
  @JsonKey(name: 'TOSYMBOL')
  final String? toSymbol;

  @HiveField(3)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime? lastUpdate;

  @HiveField(4)
  @JsonKey(name: 'HIGH24HOUR')
  final double? hei24Hours;

  @HiveField(5)
  @JsonKey(name: 'LOW24HOUR')
  final double? low24Hours;

  static int _dateTimeToJson(DateTime? date) =>
      date?.millisecondsSinceEpoch ?? 0;

  static DateTime? _dateTimeFromJson(int? millis) =>
      millis == null ? null : DateTime.fromMillisecondsSinceEpoch(millis);

  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);

  @override
  List<Object?> get props => [
    priceInUSD,
    imageUrl,
    toSymbol,
    lastUpdate,
    hei24Hours,
    low24Hours,
  ];
}
