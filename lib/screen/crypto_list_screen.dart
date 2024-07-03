import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/crypto_provider.dart';

class CryptoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices'),
      ),
      body: FutureBuilder(
        future: Provider.of<CryptoProvider>(context, listen: false).fetchCryptos(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<CryptoProvider>(
              builder: (ctx, cryptoProvider, _) => ListView.builder(
                itemCount: cryptoProvider.cryptos.length,
                itemBuilder: (ctx, index) {
                  final crypto = cryptoProvider.cryptos[index];
                  return ListTile(
                    title: Text(crypto.name),
                    subtitle: Text(crypto.symbol),
                    trailing: Text('\$${crypto.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
