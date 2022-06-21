import 'package:flutter/material.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get selectedVoucher => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/resep': (context) => ResepPage(),
    });
  }
}
