// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetails _$CryptoCoinDetailsFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetails(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String?,
      lastUpdate: CryptoCoinDetails._dateTimeFromJson(json['LASTUPDATE']),
      hei24Hours: (json['HIGH24HOUR'] as num?)?.toDouble(),
      low24Hours: (json['LOW24HOUR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailsToJson(CryptoCoinDetails instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': instance.lastUpdate?.toIso8601String(),
      'HIGH24HOUR': instance.hei24Hours,
      'LOW24HOUR': instance.low24Hours,
    };
