import "package:flutter/material.dart";
import 'new_transaction.dart';
import 'transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "T1",
      title: "New Hardware",
      amount: 178.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T2",
      title: "New Machine",
      amount: 2999.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
      title: txTitle,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    
    setState(() {
      _userTransactions.add(newTx);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }

}