import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 ) {
      return ;
    }

    newTransactionHandler(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleController,
            onSubmitted: (_) => submitData,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
            decoration: InputDecoration(
              labelText: "Amount",
            ),
          ),
          FlatButton(
            child: Text("Add Transaction"),
            textColor: Colors.purple,
            onPressed: submitData,
          )
        ],
      ),
    );
  }
}
