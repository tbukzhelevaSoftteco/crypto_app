import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(179, 247, 244, 244),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        dividerColor: Colors.black12,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lime,
          foregroundColor: Colors.black87,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(221, 29, 29, 29),
          ),
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black54,
          textColor: Colors.black87,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          labelSmall: TextStyle(color: Colors.black12, fontSize: 16),
        ),
      ),
      routes: {
        '/': (context) => const CryptoListScreen(title: 'Crypto App'),
        '/crypto-coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

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
          return ListTile(
            title: Text(coinName, style: theme.textTheme.bodyMedium),
            subtitle: Text('\$20000', style: theme.textTheme.labelSmall),
            leading: SvgPicture.asset(
              'assets/svg/bitcoin_logo.svg',
              width: 25,
              height: 25,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            onTap: () => {
              Navigator.of(
                context,
              ).pushNamed('/crypto-coin', arguments: coinName),
            },
          );
        },
        itemCount: 10,
      ),
    );
  }
}

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
