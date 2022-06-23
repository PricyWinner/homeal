import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homeal/models/models.dart';
import 'package:homeal/services/services.dart';
import 'pages/pages.dart';
import 'models/models.dart';
import 'package:homeal/components/components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get selectedResep => null;

  get bahan => null;

  get TotalPrice => null;

  @override
  void initState() {
    // firebaseinit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    firebaseinit();
    generateStore();
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/resep': (context) => ResepPage(selectedResep: selectedResep),
      '/store': (context) => ChooseStorePage(
            bahan: bahan,
          ),
      '/cart': (context) => Cartpage(),
      '/payment': (context) => PaymentPage(TotalPrice: TotalPrice),
    });
  }
}
