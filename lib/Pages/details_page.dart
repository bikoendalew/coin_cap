// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map rates;

  const DetailsPage({required this.rates});

  @override
  Widget build(BuildContext context) {
    List currencies = rates.keys.toList();
    List exchangeRates = rates.values.toList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (_context, _index) {
              String currency = currencies[_index].toString().toUpperCase();
              String _exchangeRate = exchangeRates[_index].toString();
              return ListTile(
                title: Text(
                  "$currency: $_exchangeRate",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
