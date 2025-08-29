import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio, required this.cryptoCoinBox});

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFomApi();

      final cryptoCoinsMap = {
        for (var coin in cryptoCoinsList) coin.name: coin,
      };
      await cryptoCoinBox.putAll(cryptoCoinsMap);
    } catch (e) {
      cryptoCoinsList = cryptoCoinBox.values.toList();
    }
    cryptoCoinsList.sort(
      (a, b) =>
          (b.details?.priceInUSD ?? 0).compareTo((a.details?.priceInUSD ?? 0)),
    );
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFomApi() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,XRP,AID,CAG,DOV&tsyms=USD,EUR',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetails.fromJson(usdData);

      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(currencyCode);
      cryptoCoinBox.put(currencyCode, coin);
      return coin;
    } catch (e) {
      return cryptoCoinBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD,EUR',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData =
        coinData['USD'] as Map<String, dynamic>; // Assuming USD data is needed
    final details = CryptoCoinDetails.fromJson(usdData);

    return CryptoCoin(name: currencyCode, details: details);
  }
}
