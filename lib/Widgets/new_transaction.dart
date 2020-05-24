import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_test_project/Models/transaction.dart';
import 'package:flutter_test_project/Widgets/user_transaction.dart';
import 'package:flutter_test_project/context.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_test_project/tab_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  var titleController = TextEditingController();
  var amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text("IMBD TOP 10",
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  decoration: TextDecoration.underline,
                )),
            margin: EdgeInsets.only(top: 40, bottom: 40),
          ),
        ]);
  }

  showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
