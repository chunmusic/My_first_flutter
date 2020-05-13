import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import './new_transaction.dart';
import 'package:intl/intl.dart';


class UserTransactions extends StatefulWidget {
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<dynamic> transaction = [
    Transaction(
        id: 't1',
        title: 'Pay for Krapao Kai',
        amount: 200,
        date: DateTime.now(),
        reason: "I'm hungry."),
    Transaction(
        id: 't2',
        title: 'Buy a new notebook',
        amount: 200,
        date: DateTime.now(),
        reason: "The old one was too slow."),
    Transaction(
        id: 't2',
        title: 'Buy a new mobile',
        amount: 200,
        date: DateTime.now(),
        reason: "The old one was too slow."),
    Transaction(
        id: 't2',
        title: 'Buy a new ipad',
        amount: 200,
        date: DateTime.now(),
        reason: "The old one was too slow."),
    Transaction(
        id: 't2',
        title: 'Buy a new iphone',
        amount: 200,
        date: DateTime.now(),
        reason: "The old one was too slow."),
  ];

  void addTransaction(String title, String amount) {
    setState(() {
      transaction.add(Transaction(
          id: 't-new',
          title: title,
          amount: double.parse(amount),
          date: DateTime.now(),
          reason: 'my reason'));
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction),
        ...transaction.map((tx) {
          return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
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
                        tx.title +
                            "  ---  " +
                            DateFormat('dd/MM/yyyy').format(tx.date),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text(tx.reason, style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0))));
        }).toList()
      ],
    );
  }
}