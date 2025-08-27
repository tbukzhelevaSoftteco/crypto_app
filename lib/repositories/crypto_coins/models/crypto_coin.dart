import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({required this.name, this.details});

  final String name;
  final CryptoCoinDetails? details;

  @override
  List<Object?> get props => [name];
}
