import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  var titleController = TextEditingController();
  var amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          FlatButton(
            child: Text("Submit"),
            color: Colors.blue,
            onPressed: () {
              if ((titleController.text == "") ||
                  (amountController.text == "")) {
                showAlertDialog(context, "Please check your inputs", "");
              } else {
                print("Click Button");
                print(titleController.text);
                print(amountController.text);
                addTransaction(titleController.text, amountController.text);
              }
            },
          )
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