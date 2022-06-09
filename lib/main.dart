import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/kayitekrani.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //---------- Firebase çalıştır
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: travelApp(),
  ));
}

class travelApp extends StatelessWidget {
  const travelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KayitEkrani();
  }
}
