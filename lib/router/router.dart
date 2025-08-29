import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:crypto_app/features/crypto_list/view/crypto_list_screen.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

part "router.gr.dart";

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, initial: true),
    AutoRoute(page: CryptoCoinRoute.page),
  ];
}
