import 'package:crypto_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "crypto_coin_details_event.dart";
part "crypto_coin_details_state.dart";

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this._coinsRepository)
    : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoinDetails>((event, emit) async {
      try {
        emit(CryptoCoinDetailsLoading());
        final coinDetails = await _coinsRepository.getCoinDetails(
          event.currencyCode,
        );
        emit(CryptoCoinDetailsLoaded(coinDetails: coinDetails));
      } catch (e) {
        emit(CryptoCoinDetailsLoadingFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository _coinsRepository;
}
