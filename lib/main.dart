import 'package:flutter/material.dart';

import 'Demo_Page.dart';
import 'Stepar.dart';
import 'Stepar_Damo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SteparDamo(),
    );
  }
}
