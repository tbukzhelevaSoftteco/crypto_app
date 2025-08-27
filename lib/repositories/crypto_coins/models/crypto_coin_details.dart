import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

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

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com$imageUrl';

  @JsonKey(name: 'TOSYMBOL')
  final String? toSymbol;

  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime? lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double? hei24Hours;

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
