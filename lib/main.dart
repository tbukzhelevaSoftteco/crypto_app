import 'package:crypto_app/app.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<CryptoCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio()), // твоя реализация
  );
  runApp(const CryptoCurrenciesListApp());
}
