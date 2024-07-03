import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/crypto_model.dart';

class CryptoProvider with ChangeNotifier {
  List<Crypto> _cryptos = [];

  List<Crypto> get cryptos => _cryptos;

  Future<void> fetchCryptos() async {
    final url = 'https://api.coinlore.net/api/tickers/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> cryptoData = data['data'];
        _cryptos = cryptoData.map((json) => Crypto.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load crypto prices');
      }
    } catch (error) {
      throw error;
    }
  }
}
