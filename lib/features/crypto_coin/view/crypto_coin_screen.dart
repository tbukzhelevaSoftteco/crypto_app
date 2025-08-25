import 'dart:async';

import 'package:crypto_app/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_details_bloc.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_app/repositories/crypto_coins/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  final CryptoCoin coin;

  const CryptoCoinScreen({super.key, required this.coin});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _cryptoDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<CryptoCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoDetailsBloc.add(
      LoadCryptoCoinDetails(currencyCode: widget.coin.name),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    super.didChangeDependencies();

    assert(
      args != null,
      'Expected a non-null argument for coin name, but got null',
    );
    assert(
      args is CryptoCoin,
      'Expected a CryptoCoin argument for coin name, but got $args',
    );

    final coinName = widget.coin.name;
    debugPrint("Coin name: $coinName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.coin.name ?? 'Crypto Coin Details')),
      body: RefreshIndicator(
        child: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
          bloc: _cryptoDetailsBloc,
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CryptoCoinDetailsLoaded) {
              final coinDetails = state.coinDetails;
              return ListView(
                children: [
                  Image.network(coinDetails?.imageUrl ?? ''),
                  Text('Name: ${coinDetails?.name ?? ''}'),
                  Text('Price: ${coinDetails?.priceInUSD ?? ''}'),
                  Text('Last Update: ${coinDetails?.lastUpdate ?? ''}'),
                ],
              );
            }
            if (state is CryptoCoinDetailsLoadingFailure) {
              return Center(child: Text('Failed to load coin details'));
            }
            return Container();
          },
        ),

        onRefresh: () async {
          final completer = Completer();
          _cryptoDetailsBloc.add(
            LoadCryptoCoinDetails(currencyCode: widget.coin.name),
          );
          return completer.future;
        },
      ),
    );
  }
}
