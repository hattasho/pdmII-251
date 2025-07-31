import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'providers/app_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro App',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
