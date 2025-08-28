import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  const CryptoCoin({required this.name, this.details});

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetails? details;

  @override
  List<Object?> get props => [name];
}
