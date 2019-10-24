import "package:flutter/material.dart";
import "package:intl/intl.dart";
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: ListView.builder(
        itemCount: _userTransactions.length,
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
                    child: Text('\$${_userTransactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                _userTransactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat("dd/MM/yyyy").format(_userTransactions[index].date)),
            ),
          );
        },
      ),
    );
  }
}
