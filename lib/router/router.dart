import 'package:crypto_app/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_app/features/crypto_list/view/crypto_list_screen.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/crypto-coin': (context) {
    final coin = ModalRoute.of(context)?.settings.arguments as CryptoCoin?;
    if (coin == null) {
      return const Scaffold(body: Center(child: Text('Missing coin data')));
    }
    return CryptoCoinScreen(coin: coin);
  },
};
