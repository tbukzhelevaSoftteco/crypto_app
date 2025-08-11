import 'package:crypto_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Crypto app list')),
      body: (_cryptoCoinsList == null)
          ? Center(child: const CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: theme.dividerColor, height: 1),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
              padding: EdgeInsets.only(top: 10),
              itemCount: _cryptoCoinsList!.length,
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository(dio: Dio()).getCoinsList();
    setState(() {});
  }
}
