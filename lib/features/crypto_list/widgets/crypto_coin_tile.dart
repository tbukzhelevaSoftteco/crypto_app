import 'package:crypto_app/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.priceInUSD}', style: theme.textTheme.labelSmall),
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        width: 25,
        height: 25,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () => {
        Navigator.of(context).pushNamed('/crypto-coin', arguments: coin),
      },
    );
  }
}
