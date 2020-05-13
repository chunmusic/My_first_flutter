import 'package:flutter/material.dart';
import './Widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: UserTransactions(),
        ));
  }
}
