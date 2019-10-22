import 'package:expenses_app/transaction.dart';
import "package:flutter/material.dart";
import "./transaction.dart";
import "./transactionCard.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState(appBarTitle: "Flutter App");
  }
}

class HomePageState extends State<HomePage> {
  final String appBarTitle;

  final List<Transaction> transactions = [
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

  HomePageState({this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 360,
            child: Card(
              child: Text("This is cross axis on Column"),
              color: Colors.blue,
              elevation: 5.0,
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return TransactionCard(
              title: transaction.title,
              amount: transaction.amount,
              date: transaction.date,
            );
          }).toList()),
        ],
      ),
    );
  }
}
