import 'package:crypto_app/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_app/features/crypto_list/view/crypto_list_screen.dart';

final routes = {
  '/': (context) => const CryptoListScreen(title: 'Crypto App'),
  '/crypto-coin': (context) => const CryptoCoinScreen(),
};
