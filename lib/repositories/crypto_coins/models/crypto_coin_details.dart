import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    this.toSymbol,
    this.lastUpdate,
    this.hei24Hours,
    this.low24Hours,
  });
  final String name;
  final double priceInUSD;
  final String imageUrl;
  final String? toSymbol;
  final DateTime? lastUpdate;
  final double? hei24Hours;
  final double? low24Hours;

  @override
  List<Object?> get props => [
    name,
    priceInUSD,
    imageUrl,
    toSymbol,
    lastUpdate,
    hei24Hours,
    low24Hours,
  ];
}
