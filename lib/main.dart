import 'package:crypto_app/app.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

const cryptoCoinsBoxName = 'crypto_coins_box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinDetailsAdapter());
  Hive.registerAdapter(CryptoCoinAdapter());
  final cryptoCoinBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  GetIt.I.registerLazySingleton<CryptoCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio(), cryptoCoinBox: cryptoCoinBox),
  );
  runApp(const CryptoCurrenciesListApp());
}
