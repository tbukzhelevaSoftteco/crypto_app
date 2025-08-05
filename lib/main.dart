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
        scaffoldBackgroundColor: Colors.white70,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        dividerColor: Colors.black12,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 146, 238, 116),
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
      home: const MyHomePage(title: 'Crypto App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: theme.dividerColor, height: 1),
        itemBuilder: (context, i) => ListTile(
          title: Text('Item $i', style: theme.textTheme.bodyMedium),
          subtitle: Text('\$20000', style: theme.textTheme.labelSmall),
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            width: 25,
            height: 25,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ),
        itemCount: 10,
      ),
    );
  }
}
