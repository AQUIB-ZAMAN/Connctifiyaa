import 'package:flutter/material.dart';
import './views/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connectifyaa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: LoginScreen(),
    );
  }
}
