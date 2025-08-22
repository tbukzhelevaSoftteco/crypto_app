part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  LoadCryptoCoinDetails({required this.currencyCode});

  final String currencyCode;

  @override
  List<Object?> get props => [currencyCode];
}
