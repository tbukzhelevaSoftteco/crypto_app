import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_app/repositories/crypto_coins/models/models.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.priceInUSD}', style: theme.textTheme.labelSmall),
      leading: Image.network(coin.imageUrl),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () => {
        Navigator.of(context).pushNamed('/crypto-coin', arguments: coin),
      },
    );
  }
}
