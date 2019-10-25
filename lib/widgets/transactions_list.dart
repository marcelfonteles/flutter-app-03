import "package:flutter/material.dart";
import "package:intl/intl.dart";
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransactionHandler;

  TransactionList({
    this.userTransactions,
    this.deleteTransactionHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${userTransactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                userTransactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat("dd/MM/yyyy")
                  .format(userTransactions[index].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransactionHandler(index, userTransactions),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
              FlatButton(
                onPressed: () =>
                    deleteTransactionHandler(index, userTransactions),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 94, 104, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )
 */
