import 'package:crypto_app/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: theme.dividerColor, height: 1),
        itemBuilder: (context, i) {
          final coinName = 'Item $i';
          return CryptoCoinTile(coinName: coinName);
        },
        itemCount: 10,
      ),
    );
  }
}
