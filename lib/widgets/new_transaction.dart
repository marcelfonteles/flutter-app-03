import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              labelText: "Amount",
            ),
          ),
          RaisedButton(
            child: Text("Add Transaction"),
            textColor: Colors.purple,
            onPressed: () {
              newTransactionHandler(titleController.text, double.parse(amountController.text));
            },
          )
        ],
      ),
    );
  }
}
