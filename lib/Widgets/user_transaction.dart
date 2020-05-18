import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import './new_transaction.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class UserTransactions extends StatefulWidget {
  static const routeName = '/user-transaction';
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {



  final List<dynamic> transaction = [
    Transaction(
      name: 't1',
      rating: 'Pay for Krapao Kai',
    ),
    Transaction(
        name: 'Buy a new notebook', rating: "The old one was too slow."),
  ];

  void addTransaction(String name, String rating) {
    setState(() {
      transaction.add(Transaction(
        name: name,
        rating: rating,
      ));
    });
  }

  Widget build(BuildContext context) {

    var args = ModalRoute.of(context).settings.arguments;
    print("args");
    print(args);

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NewTransaction(addTransaction),
              ...transaction.map((tx) {
                return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, .9)),
                        child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(
                                          width: 1.0, color: Colors.white24))),
                              child: Icon(Icons.thumb_up, color: Colors.white),
                            ),
                            title: Text(
                              tx.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.yellowAccent),
                                Text(" " + tx.rating,
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30.0))));
              }).toList()
            ],
          ),
        ));
  }
}
