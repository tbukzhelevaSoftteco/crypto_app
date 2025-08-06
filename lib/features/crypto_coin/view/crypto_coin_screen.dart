import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    super.didChangeDependencies();

    assert(
      args != null,
      'Expected a non-null argument for coin name, but got null',
    );
    assert(
      args is String,
      'Expected a String argument for coin name, but got $args',
    );

    coinName = args as String?;
    print("Coin name: $coinName");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? 'Crypto Coin Details')),
    );
  }
}
