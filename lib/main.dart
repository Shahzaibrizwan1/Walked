import 'package:flutter/material.dart';
import 'package:flutter_new/provider/provider.dart';
import 'package:flutter_new/JournalScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JournalProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JournalScreen(),
    );
  }
}
