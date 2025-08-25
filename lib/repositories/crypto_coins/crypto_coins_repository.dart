import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,XRP&tsyms=USD,EUR',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imgURL = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imgURL',
      );
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinDetails> getCoinDetails(String currencyCode) async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD,EUR',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData =
        coinData['USD'] as Map<String, dynamic>; // Assuming USD data is needed
    final price = usdData['PRICE'];
    final imgURL = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = DateTime.fromMillisecondsSinceEpoch(
      usdData['LASTUPDATE'] * 1000,
    );
    final high24Hours = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoinDetails(
      name: currencyCode,
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com/$imgURL',
      toSymbol: toSymbol,
      lastUpdate: lastUpdate,
      hei24Hours: high24Hours,
      low24Hours: low24Hours,
    );
  }
}
