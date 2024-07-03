import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/crypto_provider.dart';
import '../screen/crypto_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Prices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CryptoListScreen(),
    );
  }
}
